package com.dcx.blog.utils;

import com.dcx.blog.dao.pojo.SysUser;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 19:32
 * @description：
 */
public class UserThreadLocal {
    private UserThreadLocal(){}

    private static final ThreadLocal<SysUser> LOCAL = new ThreadLocal<>();

    public static void put(SysUser sysUser){
        LOCAL.set(sysUser);
    }
    public static SysUser get(){
        return LOCAL.get();
    }

    public static void remove(){
        LOCAL.remove();
    }
}
