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
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping("/verify")
    public Msg verifyUser(@RequestParam("userId")String userId) {
        int i = userService.userVerify(userId);
        if (i==1) {
            return Msg.fail();
        }
        return Msg.success();
    }

    @RequestMapping("/user")
    public String register(@RequestParam("userId")String userId,@RequestParam("userName")String userName,@RequestParam("password")String password) {
        int i = userService.register(new User(userId,password,1,userName));
        if (i == 1) {
            return "redirect:/index.jsp";
        }
        return "error";
    }

    @ResponseBody
    @RequestMapping("/api/user")
    public Msg apiRegister(@RequestParam("userId")String userId,@RequestParam("userName")String userName,@RequestParam("password")String password) {
        int i = userService.register(new User(userId,password,1,userName));
        return i == 1 ? Msg.success() : Msg.fail();
    }

    @ResponseBody
    @RequestMapping("/getUserName")
    public Msg getUserName(@RequestParam("userId")String userId) {
        User user = userService.getUser(userId);
        if (user!=null) {
            return Msg.success().add("userName",user.getUserName());
        }
        return Msg.error().add("msg","error");
    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public Msg updateUser(@RequestParam("userName")String userName,@RequestParam("password")String password,HttpSession session) {
        String userId = (String) session.getAttribute("userName");
        int i = userService.update(new User(userId, userName, 1, password));
        System.out.println(i);
        if (i==1) {
            return Msg.success();
        }
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping("/api/updateUser")
    public Msg apiUpdateUser(@RequestParam("userId")String userId, @RequestParam("userName")String userName, @RequestParam("password")String password) {
        System.out.println(userId+" "+userName+" "+password);
        int i = userService.update(new User(userId, password, 1, userName));
        System.out.println(i);
        if (i==1) {
            return Msg.success();
        }
        return Msg.error();
    }

}
