package com.goov.test.service;

import com.goov.sys.entity.User;

import java.util.List;

public interface TestService {
    Integer selectCount();

    List<User> findUserByName(String message);
}
