package com.tqy.cams.service;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzPlan;
import com.tqy.cams.bean.RzReport;
import com.tqy.cams.bean.RzTask;
import com.tqy.cams.bean.TestPoint;

/**
 * 认证测试
 **/
public interface StatisticsService {
    /**
     * 统计用户审核通过的条数
     * @param userId
     * @return
     */
    ResultMessage getStatistics(String userId);



}
