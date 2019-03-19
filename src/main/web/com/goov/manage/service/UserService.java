package com.goov.manage.service;

import com.goov.sys.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * 20190315
     * 通过登录的用户名获取用户信息
     * @param username
     * @return
     */
    User getUserByUsername(String username);

    /**
     * 20190318
     * 查询所有用户信息
     * @return
     */
    List<Map<String, Object>> findUserByPage(Map map);
}
