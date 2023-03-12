package com.dcx.blog.controller;

import com.dcx.blog.service.LoginService;
import com.dcx.blog.vo.params.LoginParam;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/5 8:10
 * @description：
 */
@RestController
@RequestMapping("register")
public class RegisterController {

    @Autowired
    private LoginService loginService;

    @PostMapping
    public Result register(@RequestBody LoginParam loginParam){
//        sso,单点登录
        return loginService.register(loginParam);
    }

}
