package com.dcx.blog.service;

import com.dcx.blog.dao.pojo.SysUser;
import com.dcx.blog.vo.params.LoginParam;
import com.dcx.blog.vo.params.Result;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/1 22:02
 * @description：
 */
public interface LoginService {

    /**
     * 登录功能
     * @param loginParam
     * @return
     */
    Result login(LoginParam loginParam);

    /**
     * 查询token
     * @param token
     * @return
     */
    SysUser checkToken(String token);

    /**
     * 退出登录
     * @param token
     * @return
     */
    Result logout(String token);

    /**
     * 注册登录
     * @param loginParam
     * @return
     */
    Result register(LoginParam loginParam);
}
