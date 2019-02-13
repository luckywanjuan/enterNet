package com.tqy.cams.dao;

import com.tqy.cams.bean.Role;
import com.tqy.cams.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户
 **/
public interface UserMapper {

    List<Role> getRoleUser();

    String getUserByName(@Param("userName") String userName, @Param("userPwd") String userPwd);
    
    String getIdByName(@Param("userName") String userName);

    List<Map<String,String>> getUsers();

    String[] getUserRoles(@Param("userId") String userId);

    List<Map<String,Object>> getUserInfo(@Param("userId") String userId);

    List<User> getUsersNoRole();

    List<Map<String,String>> getRolesByUserIds(String[] userIds);
   
}

