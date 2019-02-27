package com.tqy.cams.controller;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzPlan;
import com.tqy.cams.bean.RzReport;
import com.tqy.cams.bean.RzTask;
import com.tqy.cams.bean.TestPoint;
import com.tqy.cams.service.RzTaskService;
import com.tqy.cams.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 认证统计
 **/
@RestController
@RequestMapping("statistics")
public class StatisticsController {
    @Autowired
    StatisticsService statisticsService;

  /**
   * 获取首页统计数量
   * @param userId
   * @return
   */
    @RequestMapping("getUserPassMission")
    public ResultMessage getUserPassMission(String userId){
        return statisticsService.getStatistics(userId);
    }

  /**
   * 获取认证申请柱状图
   * @param userId
   * @return
   */
    @RequestMapping("getRzDateNum")
    public ResultMessage getRzDateNum(String userId){
      return statisticsService.getUserDateNum(userId);
    }
    /**
     * 获取测试任务柱状图
     * @param userId
     * @return
     */
    @RequestMapping("getRzTaskNum")
    public ResultMessage getRzTaskNum(String userId){
        return statisticsService.getRztaskDateCount(userId);
    }

}
