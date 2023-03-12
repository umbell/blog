package com.dcx.blog.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dcx.blog.dao.dos.Archives;
import com.dcx.blog.dao.mapper.ArticleBodyMapper;
import com.dcx.blog.dao.mapper.ArticleMapper;
import com.dcx.blog.dao.mapper.ArticleTagMapper;
import com.dcx.blog.dao.pojo.Article;
import com.dcx.blog.dao.pojo.ArticleBody;
import com.dcx.blog.dao.pojo.ArticleTag;
import com.dcx.blog.dao.pojo.SysUser;
import com.dcx.blog.service.*;
import com.dcx.blog.utils.UserThreadLocal;
import com.dcx.blog.vo.ArticleBodyVo;
import com.dcx.blog.vo.ArticleVo;
import com.dcx.blog.vo.TagVo;
import com.dcx.blog.vo.params.ArticleParam;
import com.dcx.blog.vo.params.PageParams;
import com.dcx.blog.vo.params.Result;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 21:49
 * @description：
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private TagService tagService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ArticleTagMapper articleTagMapper;
//
//    @Override
//    public Result listArticle(PageParams pageParams) {
//        Page<Article> page = new Page<>(pageParams.getPage(), pageParams.getPageSize());
//        IPage<Article> articleIPage = articleMapper.listArticle(page,
//                pageParams.getCategoryId(),
//                pageParams.getTagId(),
//                pageParams.getYear(),
//                pageParams.getMonth());
//        List<Article> records = articleIPage.getRecords();
////        new ArrayList
////        for (int i = 0; i < 10; i++) {
////
////        }
//
//        return Result.success(copyList(records,false,true));
//
//    }

    @Override
    public Result listArticle(PageParams pageParams) {
        Page<Article> page = new Page<>(pageParams.getPage(), pageParams.getPageSize());
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        if(pageParams.getCategoryId() != null){
            queryWrapper.eq(Article::getCategoryId,pageParams.getCategoryId());
        }
        List<Long> tags = new ArrayList<>();
        if(pageParams.getTagId() != null){
            LambdaQueryWrapper<ArticleTag> qw = new LambdaQueryWrapper<>();
            qw.eq(ArticleTag::getTagId,pageParams.getTagId());
            List<ArticleTag> articleTags = articleTagMapper.selectList(qw);
            for (ArticleTag articleTag : articleTags) {
                tags.add(articleTag.getArticleId());
            }
            if(tags.size() > 0){
                queryWrapper.in(Article::getId,tags);
            }
        }

        //        是否置顶进行排序
//        根据创建时间排序
        queryWrapper.orderByDesc(Article::getWeight,Article::getCreateDate);
        Page<Article> articlePage = articleMapper.selectPage(page, queryWrapper);
        List<Article> records = articlePage.getRecords();
        List<ArticleVo> articleVoList = copyList(records, true, true);
        return Result.success(articleVoList);
    }


//方法重载
    private List<ArticleVo> copyList(List<Article> records, boolean isAuthor, boolean isTags) {
        ArrayList<ArticleVo> articleVoList = new ArrayList<>();
        for (Article record:records){
            articleVoList.add(copy(record, isAuthor, isTags,false,false));
        }
        return articleVoList;
    }
    private List<ArticleVo> copyList(List<Article> records, boolean isAuthor, boolean isTags, boolean isBody, boolean isCategory) {
        ArrayList<ArticleVo> articleVoList = new ArrayList<>();
        for (Article record:records){
            articleVoList.add(copy(record, isAuthor, isTags, isBody, isCategory));
        }
        return articleVoList;
    }

    @Autowired
    CategoryService categoryService;

    private ArticleVo copy(Article article, boolean isAuthor, boolean isTags, boolean isBody, boolean isCategory){
        ArticleVo articleVo = new ArticleVo();
        articleVo.setId(String.valueOf(article.getId()));
        BeanUtils.copyProperties(article,articleVo);
        articleVo.setCreateDate(new DateTime(article.getCreateDate()).toString("yyyy-MM-dd HH:mm"));
        if(isAuthor){
            Long authorId = article.getId();//?
            articleVo.setAuthor(sysUserService.findUserById(authorId).getNickname());
        }
        if(isTags){
            articleVo.setTags(tagService.findTagsByArticleId(article.getId()));
        }
        if(isBody){
            Long bodyId = article.getBodyId();
            articleVo.setBody(findArticleBodyById(bodyId));
        }
        if(isCategory){
            Long categoryId = article.getCategoryId();
            articleVo.setCategory(categoryService.findCategoryById(categoryId));
        }

        return articleVo;
    }

    /**
     * 通过id查询文章内容
     * @param bodyId
     * @return
     */
    @Autowired
    ArticleBodyMapper articleBodyMapper;

    private ArticleBodyVo findArticleBodyById(Long bodyId) {
        ArticleBody articleBody = articleBodyMapper.selectById(bodyId);
        ArticleBodyVo articleBodyVo = new ArticleBodyVo();
        articleBodyVo.setContent(articleBody.getContent());

        return articleBodyVo;
    }

    /**
     * 首页最热文章
     * @param limit
     * @return
     */
    @Override
    public Result hotArticle(int limit) {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Article::getViewCounts);
        queryWrapper.select(Article::getId,Article::getTitle);
        queryWrapper.last("limit " + limit);
        List<Article> articles = articleMapper.selectList(queryWrapper);

        return Result.success(copyList(articles,false,false));
    }

    /**
     * 最新文章
     * @param limit
     * @return
     */
    @Override
    public Result newArticles(int limit) {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Article::getCreateDate);
        queryWrapper.select(Article::getId,Article::getTitle);
        queryWrapper.last("limit " + limit);
        List<Article> articles = articleMapper.selectList(queryWrapper);

        return Result.success(copyList(articles,false,false));

    }

    @Override
    public Result listArchives() {
        List<Archives> archivesList =  articleMapper.listArchives();
        return Result.success(archivesList);
    }

    @Autowired
    ThreadService threadService;
    @Override
    public Result findArticleById(Long articleId) {
        Article article = this.articleMapper.selectById(articleId);
        ArticleVo articleVo = copy(article, true, true, true,true);

        threadService.updateArticleViewCount(articleMapper, article);
        return Result.success(articleVo);
    }

    /**
     * 写文章
     * @param articleParam
     * @return
     */
    @Override
    public Result publish(ArticleParam articleParam) {
        SysUser sysUser = UserThreadLocal.get();

        Article article = new Article();
        article.setAuthorId(sysUser.getId());
//        System.out.println(sysUser.getId());
        article.setWeight(Article.Article_Common);
        article.setCreateDate(System.currentTimeMillis());
        article.setCommentCounts(0);
        article.setViewCounts(0);
        article.setCategoryId(Long.parseLong(articleParam.getCategory().getId()));
        article.setSummary(articleParam.getSummary());
        article.setTitle(articleParam.getTitle());
        this.articleMapper.insert(article);
        List<TagVo> tags = articleParam.getTags();
        if(tags != null){
            for (TagVo tag : tags) {
                Long articleId = article.getId();
                ArticleTag articleTag = new ArticleTag();
                articleTag.setTagId(Long.parseLong(tag.getId()));
                articleTag.setArticleId(articleId);
                articleTagMapper.insert(articleTag);
            }
        }
        //body
        ArticleBody articleBody = new ArticleBody();
        articleBody.setArticleId(article.getId());
        articleBody.setContent(articleParam.getBody().getContent());
        articleBody.setContentHtml(articleParam.getBody().getContentHtml());
        articleBodyMapper.insert(articleBody);

        article.setBodyId(articleBody.getId());
        articleMapper.updateById(article);

        Map<String,String> map = new HashMap<>();
        map.put("id",article.getId().toString());
        return Result.success(map);
    }

}
