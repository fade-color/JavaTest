package com.javatest.service;

import com.javatest.domain.User;

public interface UserService {

    int login(User user);

    int register(User user);

    int update(User user);

    int userVerify(String userId);

    User getUser(String userId);

}
