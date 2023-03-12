package com.dcx.blog.vo.params;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/1 22:04
 * @description：
 */
@Data
public class LoginParam {

    private String account;
    private String password;
    private String nickname;
}
