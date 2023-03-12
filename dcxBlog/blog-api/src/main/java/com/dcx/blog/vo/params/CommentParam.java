package com.dcx.blog.vo.params;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/7 13:10
 * @description：
 */
@Data
public class CommentParam {

    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleId;

    private String content;

    private Long parent;

    private Long toUserId;
}
