package com.javatest.domain;

import java.io.Serializable;

public class User implements Serializable {
    private String userId;

    private String password;

    private Integer flag;

    private String userName;

    private static final long serialVersionUID = 1L;

    public User() {
    }

    public User(String userId, String password) {
        this.userId = userId;
        this.password = password;
    }

    public User(String userId, String password, Integer flag, String userName) {
        this.userId = userId;
        this.password = password;
        this.flag = flag;
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}