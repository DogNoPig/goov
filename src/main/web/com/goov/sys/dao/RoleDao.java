package com.goov.sys.dao;

import com.goov.sys.entity.Role;

import java.util.List;

public interface RoleDao {
    /**
     * 20190315
     * 获取用户角色信息
     * @param userid
     * @return
     */
    List<Role> getRoles(int userid);
}
