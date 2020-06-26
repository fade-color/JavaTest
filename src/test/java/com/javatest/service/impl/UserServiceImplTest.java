package com.javatest.service.impl;

import com.javatest.domain.User;
import com.javatest.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml","classpath:spring-mybatis.xml"})
public class UserServiceImplTest {

    @Autowired
    UserMapper userMapper;

    @Test
    public void login() {
        User user = userMapper.login(new User("10001","123456"));
        if (user!=null) {
            System.out.println(user.getUserName());
            System.out.println(user.getFlag());
        }
    }

}
