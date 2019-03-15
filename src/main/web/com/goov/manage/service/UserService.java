package com.goov.manage.service;

import com.goov.sys.entity.User;

public interface UserService {
    /**
     * 20190315
     * 通过登录的用户名获取用户信息
     * @param username
     * @return
     */
    User getUserByUsername(String username);
}
