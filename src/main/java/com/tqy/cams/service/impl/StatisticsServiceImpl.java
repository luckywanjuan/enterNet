package com.tqy.cams.service.impl;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import com.tqy.cams.bean.common.BaseStatic;
import com.tqy.cams.dao.RzTaskMapper;
import com.tqy.cams.dao.StatisticsMapper;
import com.tqy.cams.service.RzTaskService;
import com.tqy.cams.service.StatisticsService;
import com.tqy.cams.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 认证测试
 **/
@Service
public class StatisticsServiceImpl implements StatisticsService {
    private final Logger logger = LoggerFactory.getLogger(StatisticsServiceImpl.class);

    @Autowired
    private StatisticsMapper statisticsMapper;

    @Override
    public ResultMessage getStatistics(String userId) {
        RoleUser roleId=statisticsMapper.getRole(userId);
        Map<String, Integer> params = new HashMap<>();
        //员工级别查询统计
        if(roleId.getRoleId().equals("3")){
           Integer passCount= statisticsMapper.getUserPassMission(userId);
           Integer NoPassCount= statisticsMapper.getUserNoPassMission(userId);
           Integer auditCount= statisticsMapper.getUserAuditMission(userId);
            params.put("审核通过",passCount);
            params.put("审核不通过",NoPassCount);
            params.put("待审核",auditCount);
        }
        //管理员 领导级别查询统计
        if(roleId.getRoleId().equals("1")||roleId.getRoleId().equals("2")){
            Integer AdminAuditCount= statisticsMapper.getAdminAuditMission(userId);
            Integer AdminNoAuditCount= statisticsMapper.getAdminNoAuditMission(userId);
            Integer TaskCount = statisticsMapper.getTaskCount(userId);
            params.put("已审核",AdminAuditCount);
            params.put("未审核",AdminNoAuditCount);
            params.put("测试任务",TaskCount);
        }
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",params);
    }

    public ResultMessage getUserDateNum(String userId){
        RoleUser roleId=statisticsMapper.getRole(userId);
        Map<String, String> params = new HashMap<>();
        //员工级别查询统计
        if(roleId.getRoleId().equals("3")){
            List<Map<String,String>> dateNum = statisticsMapper.getUserRzDateNum(userId);
            for(Map<String,String> map : dateNum){
                params.put(map.get("create_date"),map.get("num"));
            }
        }
        //管理员 领导级别查询统计
        if(roleId.getRoleId().equals("1")||roleId.getRoleId().equals("2")){
            List<Map<String,String>> dateNum = statisticsMapper.getAdminRzDateNum(userId);
            for(Map<String,String> map : dateNum){
                params.put(map.get("create_date"),map.get("num"));
            }
        }
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",params);
    }
}
