package com.tqy.cams.controller;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import com.tqy.cams.service.RzTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 认证测试
 **/
@RestController
@RequestMapping("rztask")
public class RzTaskController {

    @Autowired
    private RzTaskService rzTaskService;

    /**
     * 添加/修改任务
     */
    @RequestMapping("saveRzTask")
    public ResultMessage saveRzTask(RzTask rz){
        return rzTaskService.saveRzTask(rz);
    }

    /**
     * 测试任务查询
     * @param taskName
     * @param systemName
     * @param developDept
     * @param managerDept
     * @return
     */
    @RequestMapping("getRzTask")
    public ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept,String page, String limit){
        return rzTaskService.getRzTask(taskName,systemName,developDept,managerDept,page,limit);
    }
    
    /**
     * 获取测试任务所有名称
     * @return
     */
    @RequestMapping("getRzTaskName")
    public ResultMessage getRzTaskName() {
    	return rzTaskService.getRzTaskName();
    }

    /**
     * 根据id查询测试任务
     * @param id
     * @return
     */
    @RequestMapping("getRzTaskMsg")
    public ResultMessage getRzTaskMsg(String id){
        return rzTaskService.getRzTaskMsg(id);
    }
    
    /**
     * 保存测试计划
     */
    @RequestMapping("saveRzPlan")
    public ResultMessage saveRzPlan(RzPlan rzp){
        return rzTaskService.saveRzPlan(rzp);
    }

    /**
     * 保存/修改测试报告
     */
    @RequestMapping("saveRzReport")
    public ResultMessage saveRzReport(RzReport rzr){
        return rzTaskService.saveRzReport(rzr);
    }

    /**
     * 新建要点内容
     */
    @RequestMapping("savePoint")
    public ResultMessage savePoint(TestPoint tp){
        return rzTaskService.saveTestPoint(tp);
    }
    /**
     * 根据id修改要点内容
     * @param
     * @return
     */
    @RequestMapping("updatePoint")
    public ResultMessage updatePoint(TestPoint tp){
        return rzTaskService.saveTestPoint(tp);
    }
    /**
     * 新建要点内容库
     */

    @RequestMapping("getPoint")
    public ResultMessage getRzPoint(String id){
        return rzTaskService.getTestPoint(id);
    }

    @RequestMapping("getAllPoint")
    public ResultMessage getAllPoint(){
        return rzTaskService.getAllPoint();
    }

}
