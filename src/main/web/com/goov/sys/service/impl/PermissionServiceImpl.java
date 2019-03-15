package com.goov.sys.service.impl;

import com.goov.sys.dao.PermissionDao;
import com.goov.sys.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Override
    public List<String> getTheUrl(String username) {
        return permissionDao.getTheUrl(username);
    }
}
