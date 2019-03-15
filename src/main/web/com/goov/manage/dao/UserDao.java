package com.goov.manage.dao;

import com.goov.sys.entity.User;

public interface UserDao {
    /**
     * 20190315
     * 通过用户名获取用户信息
     * @param userName
     * @return User
     */
    User getUserByUsername(String userName);
}
