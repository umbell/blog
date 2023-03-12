package com.dcx.blog.dao.pojo;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 20:29
 * @description：
 */
@Data
public class ArticleBody {

    private Long id;
    private String content;
    private String contentHtml;
    private Long articleId;
}
