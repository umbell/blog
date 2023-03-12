package com.dcx.blog.controller;

import com.dcx.blog.service.SysUserService;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/4 21:55
 * @description：
 */
@RestController
@RequestMapping("users")
public class UsersController {

    @Autowired
    SysUserService sysUserService;

    @GetMapping("currentUser")
    public Result currentUser(@RequestHeader("Authorization") String token){
        return sysUserService.findUserByToken(token);
    }
}
