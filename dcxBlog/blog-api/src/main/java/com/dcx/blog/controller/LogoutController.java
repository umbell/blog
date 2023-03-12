package com.dcx.blog.controller;

import com.dcx.blog.service.LoginService;
import com.dcx.blog.vo.params.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/4 22:40
 * @description：
 */
@RestController
@RequestMapping("logout")
public class LogoutController {

    @Autowired
    LoginService loginService;

    @GetMapping
    public Result logout(@RequestHeader("Authorization")String token){

        return loginService.logout(token);
    }
}
