package com.goov.manage.dao;

import com.goov.sys.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    /**
     * 20190315
     * 通过用户名获取用户信息
     * @param userName
     * @return User
     */
    User getUserByUsername(String userName);

    /**
     * 20190318
     * 查询所有用户
     * @return
     */
    List<Map<String, Object>> findUserByPage(Map map);
}
