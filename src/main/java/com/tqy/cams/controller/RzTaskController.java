package com.tqy.cams.controller;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzApplication;
import com.tqy.cams.bean.RzCheckRz;
import com.tqy.cams.bean.RzTask;
import com.tqy.cams.service.RzTaskService;
import com.tqy.cams.service.RzblService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证办理
 **/
@RestController
@RequestMapping("rztask")
public class RzTaskController {


    @Autowired
    private RzTaskService rzTaskService;

    /**
     * 添加任务
     */
    @RequestMapping("saveRzTask")
    public ResultMessage saveRzTask(RzTask rz){
        return rzTaskService.saveRzTask(rz);
    }

    /**
     * 根据条件查询
     * @param taskName
     * @param systemName
     * @param developDept
     * @param managerDept
     * @return
     */
    @RequestMapping("getRzTask")
    public ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept){
        return rzTaskService.getRzTask(taskName,systemName,developDept,managerDept);
    }

    /**
     * 根据id查询详细数据
     * @param id
     * @return
     */
    @RequestMapping("getRzTaskMsg")
    public ResultMessage getRzTaskMsg(String id){
        return rzTaskService.getRzTaskMsg(id);
    }
     /**
     * 根据id修改详细数据
     * @param id
     * @return
     */
    @RequestMapping("updateRzTaskMsg")
    public ResultMessage updateRzTaskMsg(RzTask rz,String id){
        return rzTaskService.updateRzTaskMsg(rz,id);
    }
}
