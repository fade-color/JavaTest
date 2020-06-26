package com.javatest.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml","classpath:spring-mybatis.xml"})
public class UserServiceTest {

    @Autowired
    UserService userService;

    @Test
    public void register() {
        int i = userService.userVerify("10002");
        System.out.println(i);
    }

}
