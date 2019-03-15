package com.goov.sys.dao;

import java.util.List;

public interface PermissionDao {
    /**
     * 20190315
     * 获取权限信息
     * @param userName
     * @return lists
     */
    List<String> getTheUrl(String userName);
}
