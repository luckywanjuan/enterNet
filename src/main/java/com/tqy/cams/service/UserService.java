package com.tqy.cams.service;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.Role;
import com.tqy.cams.bean.User;

import java.util.List;
import java.util.Map;

/**
 * 用户
 **/
public interface UserService {
    /**
     * 获取角色下用户
     */
    List<Role> getRoleUser();

    /**
     * 登录
     */
    ResultMessage login(String userName, String userPwd);

    /**
     * 获取用户信息，包含角色
     */
    List<Map<String,String>> getUsers();

    /**
     * 获取用户角色集合
     */
    String[] getUserRoles(String userId);

    ResultMessage getUserInfo(String userId);

    List<User> getUsersNoRole();

    List<Map<String,String>> getRolesByUserIds(String userIds);
}
