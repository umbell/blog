package com.dcx.blog.dao.dos;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/26 21:28
 * @description：
 */
@Data
public class Archives {
    private Integer year;
    private Integer month;
    private Long count;
}
