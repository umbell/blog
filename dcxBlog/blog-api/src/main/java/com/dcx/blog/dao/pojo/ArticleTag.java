package com.dcx.blog.dao.pojo;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/8 18:42
 * @description：
 */
@Data
public class ArticleTag {

    private Long id;

    private Long articleId;

    private Long tagId;
}
