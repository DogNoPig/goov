package com.goov.sys.service;

import com.goov.sys.entity.Role;

import java.util.List;

public interface RoleService {
    /**
     * 20190315
     * 根据用户id获取该用户的角色信息
     * @param userid
     * @return
     */
    List<Role> getRoles(int userid);
}
