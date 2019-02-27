package com.tqy.cams.bean;

import com.tqy.cams.bean.User;

import java.io.Serializable;
import java.util.List;

public class RoleUser implements Serializable {
    private static final long serialVersionUID = 2030838869501825729L;
    private String roleId;
    private String userId;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
