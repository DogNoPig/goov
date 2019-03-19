package com.goov.manage.service.impl;

import com.goov.manage.dao.UserDao;
import com.goov.manage.service.UserService;
import com.goov.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Override
    public List<Map<String, Object>> findUserByPage(Map map) {
        return userDao.findUserByPage(map);
    }
}
