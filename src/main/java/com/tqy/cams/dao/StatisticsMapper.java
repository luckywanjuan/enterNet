package com.tqy.cams.dao;

import com.tqy.cams.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 认证统计
 */
public interface StatisticsMapper {

    /**
     * 统计用户通过任务数量
     * @param
     * @return
     */
    Integer getUserPassMission(String userId);

    /**
     * 查找权限关系
     * @param userId
     * @return
     */
    RoleUser getRole(String userId);
    /**
     * 统计用户不通过任务数量
     * @param
     * @return
     */
    Integer getUserNoPassMission(String userId);

    /**
     * 统计用户待审核任务数量
     * @param
     * @return
     */
    Integer getUserAuditMission(String userId);

    /**
     * 管理员级别查询审核过的
     * @param
     * @return
     */
    Integer getAdminAuditMission(String userId);
    /**
     * 管理员级别查询未审核过的
     * @param
     * @return
     */
    Integer getAdminNoAuditMission(String userId);
    /**
     * 管理员级别查询测试任务数量
     * @param
     * @return
     */
    Integer getTaskCount(String userId);

    /**
     * 用户柱状图日期和申请次数
     * @param userId
     * @return
     */
    List<Map<String,Object>> getUserRzDateNum(String userId);

    /**
     * 管理员柱状图日期和申请次数
     * @param userId
     * @return
     */
    List<Map<String,Object>> getAdminRzDateNum(String userId);

}
