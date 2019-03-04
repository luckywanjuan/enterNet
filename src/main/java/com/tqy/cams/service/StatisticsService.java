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
     * 获取首页统计数量
     * @param userId
     * @return
     */
    ResultMessage getStatistics(String userId);

    /**
     * 获取认证申请柱状图
     * @param userId
     * @return
     */
    ResultMessage getUserDateNum(String userId);

    /**
     * 获取测试任务申请柱状图
     * @param userId
     * @return
     */
    ResultMessage getRztaskDateCount(String userId);


    /**
     * 根据管理单位查询信息
     * @param userId
     * @return
     */
    ResultMessage getManagerMission(String userId,String state);

}
