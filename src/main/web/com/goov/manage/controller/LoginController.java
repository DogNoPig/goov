package com.goov.manage.controller;

import com.goov.manage.service.UserService;
import com.goov.sys.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 登录控制
 * @author xw
 */
@Controller
@RequestMapping("")
public class LoginController {
    @Autowired
    private UserService userService;
    /**
     * 跳转到登录页
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "/index/login";
    }

    /**
     * 处理登录信息
     * @param request
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(HttpServletRequest request){
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = null;
        if (username != null && !"".equals(username)){
            user = userService.getUserByUsername(username);
            if (user == null){
                request.setAttribute("msg","用户不存在！");
                return "/index/login";
            }
        }else{
            request.setAttribute("msg","请输入用户名及密码！");
            return "/index/login";
        }
        if (user != null){
            if(!user.getPassword().equals(password)){
                request.setAttribute("msg","账号密码错误！");
                return "/index/login";
            }
        }
        SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());//如果原来有的话，就退出
        //登录后存放进shiro token
        if (user!=null) {
            UsernamePasswordToken token=new UsernamePasswordToken(user.getUsername(),user.getPassword());
            Subject subject=SecurityUtils.getSubject();
            subject.login(token);
            String username1 = (String)SecurityUtils.getSubject().getPrincipal();
            //User user1 = (User) SecurityUtils.getSubject().getPrincipal();
            //System.out.println("username===="+user1.getUsername());
            //登录成功后会跳转到successUrl配置的链接，不用管下面返回的链接
            return "redirect:/person";
        }
        return "/index/index";
    }
    @RequestMapping("/logout")
    public String logout(){
        SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());//退出
        return "redirect:/login";
    }
    @RequestMapping("/person")
    public String index(){

        return "/index/index";
    }
}
