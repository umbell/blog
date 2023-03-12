package com.dcx.blog.controller;

import com.dcx.blog.common.aop.LogAnnotation;
import com.dcx.blog.common.cache.Cache;
import com.dcx.blog.service.ArticleService;
import com.dcx.blog.vo.params.ArticleParam;
import com.dcx.blog.vo.params.PageParams;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 21:22
 * @description：
 */
@RestController
@RequestMapping("articles")
public class ArticleController {

    /**
     * 首页 文章列表
     * @param pageParams
     * @return
     */

    @Autowired
    private ArticleService articleService;

    @LogAnnotation(module = "文章",operator = "获取文章列表")
    @Cache(expire = 5 * 60 * 1000,name = "获取文章列表")
    @PostMapping
    public Result listArticle(@RequestBody PageParams pageParams){
        //ArticleVo 页面接收的数据
//         Result  articles = articleService.listArticle(pageParams);

        return articleService.listArticle(pageParams);
    }

    /**
     * 最热文章
     * @return
     */
    @PostMapping("hot")
    @Cache(expire = 5 * 60 * 1000,name = "hot_article")
    public Result hotArticle(){
        int limit = 5;
        return articleService.hotArticle(limit);
    }


    /**
     * 最新文章
     * @return
     */
    @PostMapping("new")
    @Cache(expire = 5 * 60 * 1000,name = "new_article")
    public Result newArticles(){
        int limit = 5;
        return articleService.newArticles(limit);
    }

    @PostMapping("listArchives")  //archives   档案
    public Result listArchives(){
        return articleService.listArchives();
    }

    @PostMapping("view/{id}")
    public Result findArticleById(@PathVariable("id") Long articleId){
        return articleService.findArticleById(articleId);
    }

    /**
     * 写文章
     * @param articleParam
     * @return
     */
    @PostMapping("publish")
    public Result publish(@RequestBody ArticleParam articleParam){
        return articleService.publish(articleParam);
    }

}
