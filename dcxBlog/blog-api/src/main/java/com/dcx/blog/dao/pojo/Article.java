package com.dcx.blog.dao.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 20:40
 * @description：
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
    public static final int Article_TOP = 1;
    public static final int Article_Common = 0;
    private Long id;
    private String title;
    private String summary;
    private Integer commentCounts;
    private Integer viewCounts;
//    作者id
    private Long authorId;
//    内容id
    private Long bodyId;
//    类别id
    private Long categoryId;
//    置顶
    private Integer weight;
//    创建时间
    private Long createDate;

}
