package com.javatest.controller;

import com.javatest.domain.Msg;
import com.javatest.domain.User;
import com.javatest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @Autowired
    HttpServletRequest request;

    /**
     * @ResponseBody 需导入jackson包，将返回值转为json字符串
     * 登录
     * @Return
     */
    @RequestMapping("/login")
    @ResponseBody // 自动将返回值转为json字符串
    public Msg login(@RequestParam("username")String username,@RequestParam("password")String password) {
        if (!"".equals(username)&&!"".equals(password)) {
            if (userService.login(new User(username,password))==1) {
                return Msg.success();
            }
        }
        return Msg.fail();
    }

    @RequestMapping("/enterMain")
    public String enterMain(@RequestParam("username")String username, @RequestParam("password")String password) {
        if (!"".equals(username)&&!"".equals(password)) {
            if (userService.login(new User(username,password))==1) {
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("flag",userService.getUser(username).getFlag());
                return "redirect:/welcome.jsp"; // 重定向到主页面
            }
        }
        return "error";
    }

    @RequestMapping("/addProblem")
    public String toAddProblemPage() {
        return "/addProblem";
    }

    @RequestMapping("/logout")
    public String enterCode() {
        request.getSession().invalidate();//销毁session
        return "redirect:/welcome.jsp";
    }

}
