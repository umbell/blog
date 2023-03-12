package com.dcx.blog.vo.params;

import com.dcx.blog.vo.CategoryVo;
import com.dcx.blog.vo.TagVo;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.List;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/8 18:04
 * @description：
 */
@Data
public class ArticleParam {

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private ArticleBodyParam body;

    private CategoryVo category;

    private String summary;

    private List<TagVo> tags;

    private String title;

}

