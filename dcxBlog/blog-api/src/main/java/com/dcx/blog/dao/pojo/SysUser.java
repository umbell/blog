package com.dcx.blog.dao.pojo;

import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 20:46
 * @description：
 */
@Data
public class SysUser {
    private Long id;
    private String account;
    private Integer admin;
    private String avatar;
    private Long createDate;
    private Integer deleted;
    private String email;
    private Long lastLogin;
    private String mobilePhoneNumber;
    private String nickname;
    private String password;
    private String salt;
    private String status;
}
