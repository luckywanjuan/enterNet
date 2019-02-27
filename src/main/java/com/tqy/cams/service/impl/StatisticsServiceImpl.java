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
        //员工级别查询统计
        if(roleId.getRoleId().equals("3")){
            Map<String, Integer> params = new HashMap<>();
           Integer passCount= statisticsMapper.getUserPassMission(userId);
           Integer NoPassCount= statisticsMapper.getUserNoPassMission(userId);
            Integer auditCount= statisticsMapper.getUserAuditMission(userId);
           params.put("员工审核通过条数",passCount);
            params.put("员工审核不通过条数",NoPassCount);
            params.put("员工待审核条数",auditCount);
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"查询员工统计状态条数成功",params);
        }
        //管理员 领导级别查询统计
        if(roleId.getRoleId().equals("1")||roleId.getRoleId().equals("2")){
            Map<String, Integer> params = new HashMap<>();
            Integer AdminAuditCount= statisticsMapper.getAdminAuditMission(userId);
            Integer AdminNoAuditCount= statisticsMapper.getAdminNoAuditMission(userId);
            Integer TaskCount = statisticsMapper.getTaskCount(userId);
            params.put("管理员已审核条数",AdminAuditCount);
            params.put("管理员未审核条数",AdminNoAuditCount);
            params.put("测试任务条数",TaskCount);
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"查询管理员统计状态条数成功",params);
        }


        return null;
    }

    public ResultMessage getRztaskDateCount(String userId){
         Map<String,Map<String,Integer>> params = new HashMap<>();
         Map<String,Integer> params1 = new HashMap<>();
        Integer count = statisticsMapper.getRztaskDateCount(userId);
        StringUtil.getTimeStamp("yyyy-MM-dd");
        params1.put("sj",count);
        params.put("测试任务时间统计条数",params1);

        return new ResultMessage(BaseStatic.SUCCESS_CODE,"查询测试任务统计时间成功",params);
    }
}
