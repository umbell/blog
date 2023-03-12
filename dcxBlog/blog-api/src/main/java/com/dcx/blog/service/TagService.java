package com.dcx.blog.service;

import com.dcx.blog.vo.TagVo;
import com.dcx.blog.vo.params.Result;

import java.util.List;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/25 16:33
 * @description：
 */
public interface TagService {
    List<TagVo> findTagsByArticleId(Long articleId);

    Result hots(int limit);

    /**
     * 查询所有标签
     * @return
     */
    Result findAll();

    /**
     * 查询所有标签细节
     * @return
     */
    Result findAllDetail();
    /**
     * 通过Id查询所有标签细节
     * @return
     */
    Result findDetailById(Long id);
}
