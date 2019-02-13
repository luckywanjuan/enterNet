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
@RequestMapping("rzbl")
public class RzTaskController {

    @Autowired
    private RzblService rzblService;
    @Autowired
    private RzTaskService rzTaskService;

    /**
     * 添加任务
     */
    @RequestMapping("saveRzTask")
    public ResultMessage saveRzTask(RzTask rz){
        return rzTaskService.saveRzTask(rz);
    }
    

}
