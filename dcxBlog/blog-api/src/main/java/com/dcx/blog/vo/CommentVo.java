package com.dcx.blog.vo;

import lombok.Data;

import java.util.List;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 10:47
 * @description：
 */

@Data
public class CommentVo  {

//    @JsonSerialize(using = ToStringSerializer.class)
    private String id;

    private UserVo author;

    private String content;

    private List<CommentVo> childrens;

    private String createDate;

    private Integer level;

    private UserVo toUser;
}
