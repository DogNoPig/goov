package com.goov.sys.service;

import java.util.List;

public interface PermissionService {
    /**
     * 20190315
     * 获取权限信息
     * @param username
     * @return
     */
    List<String> getTheUrl(String username);
}
