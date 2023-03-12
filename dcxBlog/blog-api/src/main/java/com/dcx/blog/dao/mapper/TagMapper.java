package com.dcx.blog.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dcx.blog.dao.pojo.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 21:21
 * @description：
 */
@Repository
public interface TagMapper extends BaseMapper<Tag> {
    /**
     * 根据文章id查询文章列表
     * @param articleId
     * @return
     */
//    通过文章id查找标签
    List<Tag> findTagsByArticleId(Long articleId);

//    查找最热标签id
    List<Long> findHotsTagIds(int limit);

//    通过TagIds查找文章
    List<Tag> findTagsByTagIds(List tagIds);
}
