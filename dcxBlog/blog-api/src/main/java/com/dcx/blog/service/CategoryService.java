package com.dcx.blog.service;

import com.dcx.blog.vo.CategoryVo;
import com.dcx.blog.vo.params.Result;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 21:16
 * @description：
 */
public interface CategoryService {

    CategoryVo findCategoryById(Long categoryId);

    Result findAll();

    Result findAllDetail();

    Result findAllDetailById(Long id);
}
