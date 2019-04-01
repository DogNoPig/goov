package com.goov.test.service.impl;

import com.goov.sys.entity.User;
import com.goov.test.dao.TestDao;
import com.goov.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TestDao testDao;
    @Override
    public Integer selectCount() {
        return testDao.selectCount();
    }

    @Override
    public List<User> findUserByName(String message) {
        return testDao.findUserByName(message);
    }
}
