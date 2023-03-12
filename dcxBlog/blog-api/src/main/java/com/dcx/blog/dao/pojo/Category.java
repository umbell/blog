package com.dcx.blog.dao.pojo;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 20:30
 * @description：
 */
@Data
public class Category {

    private Long id;

    private String avatar;

    private String categoryName;

    private String description;
}
