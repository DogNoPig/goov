package com.goov.test.controller;

import com.goov.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class TestController {
    @Autowired
    private TestService testService;
    @RequestMapping("/index")
    public String indexTest2() {
        System.out.println("进入首页！");
        Integer count = testService.selectCount();
        System.out.println("答案数量为+"+count);
        return "/index";
    }

}
