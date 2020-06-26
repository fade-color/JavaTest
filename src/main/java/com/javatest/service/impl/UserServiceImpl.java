package com.javatest.service.impl;

import com.javatest.domain.User;
import com.javatest.mapper.UserMapper;
import com.javatest.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public int userVerify(String userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        if (user!=null)
            return 1; // 有
        return 0; // 没有
    }

    @Override
    public User getUser(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public int login(User user) {
        User user1 = userMapper.login(user);
        if (user1!=null)
            return 1;
        return 0;
    }

    @Override
    public int register(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public int update(User user) {
        return userMapper.updateByPrimaryKey(user);
    }
}
