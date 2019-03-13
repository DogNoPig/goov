package com.goov.test.service.impl;

import com.goov.test.dao.TestDao;
import com.goov.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TestDao testDao;
    @Override
    public Integer selectCount() {
        return testDao.selectCount();
    }
}
