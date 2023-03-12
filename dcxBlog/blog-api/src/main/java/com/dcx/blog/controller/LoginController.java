package com.dcx.blog.controller;

import com.dcx.blog.service.LoginService;
import com.dcx.blog.vo.params.LoginParam;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/1 22:01
 * @description：
 */
@RestController
@RequestMapping("login")
public class LoginController {

    @Autowired
    LoginService loginService;

    @PostMapping
    public Result login(@RequestBody LoginParam loginParam){
        return loginService.login(loginParam);
    }
}
