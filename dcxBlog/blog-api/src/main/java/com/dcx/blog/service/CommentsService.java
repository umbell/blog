package com.dcx.blog.service;

import com.dcx.blog.vo.params.CommentParam;
import com.dcx.blog.vo.params.Result;
import org.springframework.stereotype.Repository;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 10:39
 * @description：
 */
@Repository
public interface CommentsService {

    Result commentsByArticleId(Long id);

//    添加评论
    Result comment(CommentParam commentParam);
}
