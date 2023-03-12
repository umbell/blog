package com.dcx.blog.vo;

import lombok.Data;

import java.util.List;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 22:09
 * @description：
 */
@Data
public class ArticleVo {

//    @JsonSerialize(using = ToStringSerializer.class)
    private String id;
    private String title;
    private String summary;
    private Integer commentCounts;
    private Integer viewCounts;
    private Integer weight;
    private String createDate;
    private String author;
    private ArticleBodyVo body;
    private List<TagVo> tags;
    private CategoryVo category;



}
