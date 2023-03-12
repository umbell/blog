package com.dcx.blog.service;

import com.dcx.blog.vo.params.ArticleParam;
import com.dcx.blog.vo.params.PageParams;
import com.dcx.blog.vo.params.Result;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 21:45
 * @description：
 */
public interface ArticleService {

    /**
     * 分页查询 文章列表
     * @param pageParams
     * @return
     */
    Result listArticle(PageParams pageParams);

    /**
     * 最热文章
     * @param limit
     * @return
     */
    Result hotArticle(int limit);

    /**
     * 最新文章
     * @param limit
     * @return
     */
    Result newArticles(int limit);

    /**
     * 文章归档
     * @return
     */
    Result listArchives();

    /**
     * 通过id查看文章详情
     * @return
     */
    Result findArticleById(Long articleId);

    /**
     * 写文章
     * @return
     * @param articleParam
     */
    Result publish(ArticleParam articleParam);
}
