package com.goov.test.dao;

import com.goov.sys.entity.User;

import java.util.List;

public interface TestDao {
    Integer selectCount();

    List<User> findUserByName(String message);
}
