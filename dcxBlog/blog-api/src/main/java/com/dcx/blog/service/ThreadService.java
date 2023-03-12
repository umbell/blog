package com.dcx.blog.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.dcx.blog.dao.mapper.ArticleMapper;
import com.dcx.blog.dao.pojo.Article;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/6 22:19
 * @description：
 */
@Component
public class ThreadService {

    @Async("taskExecutor")
    public void updateArticleViewCount(ArticleMapper articleMapper, Article article){
        try {
            int viewCount = article.getViewCounts();
            Article articleUpdate = new Article();
            articleUpdate.setViewCounts(viewCount + 1);
            LambdaQueryWrapper<Article> qw = new LambdaQueryWrapper<>();
            qw.eq(Article::getId,article.getId());
            //保证线程安全
            qw.eq(Article::getViewCounts,article.getViewCounts());
            articleMapper.update(articleUpdate,qw);
            Thread.sleep(5000);
            System.out.println("更新完成了...");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    };
}
