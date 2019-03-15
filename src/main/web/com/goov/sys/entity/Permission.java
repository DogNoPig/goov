package com.goov.sys.entity;
/**
 * 权限表
 * @author Administrator
 *
 */
public class Permission {
    private Integer id;
    private String token;//权限名
    private String theurl;//权限url
    private String description;//权限描述
    private Integer parent_id;//父权限

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public String getTheurl() {
        return theurl;
    }
    public void setTheurl(String theurl) {
        this.theurl = theurl;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public Integer getParent_id() {
        return parent_id;
    }
    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }
}
