package com.dcx.blog.controller;

import com.dcx.blog.dao.pojo.SysUser;
import com.dcx.blog.utils.UserThreadLocal;
import com.dcx.blog.vo.params.Result;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 19:25
 * @description：
 */
@RestController
@RequestMapping("test")
public class TestController {

    @RequestMapping
    public Result test(){
        SysUser sysUser = UserThreadLocal.get();
        System.out.println(sysUser);
        return Result.success(null);
    }
}
