package com.goov.manage.controller;

import com.goov.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/user")
public class UserManageController {
    @Autowired
    private UserService userService;
    @RequestMapping("/list")
    public String list(HttpServletRequest request){

        return "/user/Test";
    }
    @RequestMapping("/list/{currPage}/{pageSize}")
    public String page(HttpServletRequest request, @PathVariable("currPage")Integer currPage,@PathVariable("pageSize")Integer pageSize){
        Map<String, Object> param = new HashMap<>();
        param.put("currPage",currPage);
        param.put("pageSize",pageSize);
        List<Map<String, Object>> users = userService.findUserByPage(param);
        request.setAttribute("users",users);

        return "/user/Test";
    }

}
