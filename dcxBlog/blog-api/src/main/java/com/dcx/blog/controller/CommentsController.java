package com.dcx.blog.controller;

import com.dcx.blog.service.CommentsService;
import com.dcx.blog.vo.params.CommentParam;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 10:05
 * @description：
 */
@RestController
@RequestMapping("comments")
public class CommentsController {

    @Autowired
    CommentsService commentsService;

    @GetMapping("article/{id}")
    public Result comments(@PathVariable("id") Long id){
        return commentsService.commentsByArticleId(id);
    }
    @PostMapping("create/change")
    public Result comment(@RequestBody CommentParam commentParam){
        return commentsService.comment(commentParam);
    }

}
