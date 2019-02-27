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
 * 认证测试
 **/
@RestController
@RequestMapping("statistics")
public class StatisticsController {
  @Autowired
    StatisticsService statisticsService;

    @RequestMapping("getUserPassMission")
    public ResultMessage getUserPassMission(String userId){
        return statisticsService.getStatistics(userId);
    }


}
