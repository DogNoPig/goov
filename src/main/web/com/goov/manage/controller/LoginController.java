package com.goov.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录控制
 * @author xw
 */
@Controller
@RequestMapping("")
public class LoginController {
    @RequestMapping("/login")
    public String login(){

        return "/index/login";
    }
    @RequestMapping("/person")
    public String index(){

        return "/index/index";
    }
}
