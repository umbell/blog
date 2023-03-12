package com.dcx.blog.dao.pojo;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 9:59
 * @description：
 */
@Data
public class Comment {

    private Long id;

    private String content;

    private Long createDate;

    private Long articleId;

    private Long authorId;

    private Long parentId;

    private Long toUid;

    private Integer level;
}
