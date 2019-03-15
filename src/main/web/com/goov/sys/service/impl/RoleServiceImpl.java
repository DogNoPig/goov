package com.goov.sys.service.impl;

import com.goov.sys.dao.RoleDao;
import com.goov.sys.entity.Role;
import com.goov.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<Role> getRoles(int userid) {
        return roleDao.getRoles(userid);
    }
}
