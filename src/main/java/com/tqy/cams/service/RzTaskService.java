package com.tqy.cams.service;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;

/**
 * 认证办理
 **/
public interface RzTaskService {

    /**
     * 创教新任务
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
    /*ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept);
*/
    /**
     *  根据id查询任务详细
     * @param id
     * @return
     */
    ResultMessage getRzTaskMsg(String id);

    /**
     * 根据id修改任务详细
     * @param id
     * @return
     */
    ResultMessage updateRzTaskMsg(RzTask rz,String id);

    /**
     * 创教新计划
     * @param rzp
     * @return
     */
    ResultMessage saveRzPlan(RzPlan rzp);

    /**
     * 获取2个参数---系统管理单位和研制单位
     * @param
     * @return
     */
    ResultMessage getRzPlanMsg(String taskName);

    /**
     * 创建测试报告
     * @param rzr
     * @return
     */
    ResultMessage saveRzReport(RzReport rzr);

    /**
     * 在线编辑修改测试报告
     * @param rz
     * @param id
     * @return
     */
    ResultMessage updateRzReport(RzReport rz,String id);

    /**
     * 添加新的要点内容
     * @param tp
     * @return
     */
    ResultMessage saveTestPoint(TestPoint tp);

    /**
     * 修改测试要点内容
     * @param tp
     * @return
     */
    ResultMessage updateTestPoint(TestPoint tp,String id);

    /**
     * 创建新的要点管理库
     * @param rzb
     * @return
     */
    ResultMessage saveRzBank(RzBank rzb);

}
