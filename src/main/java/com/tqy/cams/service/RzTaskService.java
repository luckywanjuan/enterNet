package com.tqy.cams.service;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 认证办理
 **/
public interface RzTaskService {

    /**
     * 创教/更新新任务
     * @param rz
     * @return
     */
    ResultMessage saveRzTask(RzTask rz);

    /**
     * 根据条件查询任务
     * @param taskName
     * @param systemName
     * @param developDept
     * @param managerDept
     * @return
     */
    PageResult getRzTask(String taskName,String systemName,String developDept,String managerDept,String pageNo, String pageSize);

    /**
     * 获取测试任务所有名称
     * @return
     */
    ResultMessage getRzTaskName();
    
    /**
     *  根据id查询任务详细
     * @param id
     * @return
     */
    PageResult getRzTaskMsg(String id);

    /**
     * 创教新计划
     * @param rzp
     * @return
     */
    ResultMessage saveRzPlan(RzPlan rzp);

    /**
     * 创建测试报告
     * @param rzr
     * @return
     */
    ResultMessage saveRzReport(RzReport rzr);

    /**
     * 添加新的要点内容
     * @param tp
     * @return
     */
    ResultMessage saveTestPoint(TestPoint tp);

    /**
     * 根据id获取要点的详细内容
     * @param id
     * @return
     */
    PageResult getTestPoint(String id);

    /**
     * 获取所有的要点内容
     * @return
     */
    PageResult getAllPoint();
}
