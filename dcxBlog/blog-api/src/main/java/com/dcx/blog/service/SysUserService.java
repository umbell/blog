package com.dcx.blog.service;

import com.dcx.blog.dao.pojo.SysUser;
import com.dcx.blog.vo.UserVo;
import com.dcx.blog.vo.params.Result;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/25 16:31
 * @description：
 */
public interface SysUserService {

//  根据id查询UserVo
    UserVo findUserVoById(Long id);

//  根据id查询账户信息
    SysUser findUserById(Long id);

//    通过账户名和密码
    SysUser findUser(String account, String password);

//    通过token检验用户
    Result findUserByToken(String token);

//    通过账户查找用户信息
    SysUser findUserByAccount(String account);

//    添加用户信息
    void save(SysUser sysUser);
}
