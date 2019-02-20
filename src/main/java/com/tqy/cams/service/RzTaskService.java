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
    PageResult getRzTask(String taskName,String systemName,String developDept,String managerDept,String pageNo, String pageSize);

    /**
     *  根据id查询任务详细
     * @param id
     * @return
     */
    PageResult getRzTaskMsg(String id);

   /* *//**
     * 根据id修改任务详细
     * @param id
     * @return
     *//*
    ResultMessage updateRzTaskMsg(RzTask rz);
*/
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
    PageResult getRzPlanMsg(String id);

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
    /*ResultMessage updateRzReport(RzReport rz,String id);*/

    /**
     * 添加新的要点内容
     * @param tp
     * @return
     */
    ResultMessage saveTestPoint(TestPoint tp);

  /*  *//**
     * 修改测试要点内容
     * @param tp
     * @return
     *//*
    ResultMessage updateTestPoint(TestPoint tp,String id);*/

   /* *//**
     * 创建新的要点管理库
     * @param rzb
     * @return
     *//*
    ResultMessage saveRzBank(RzBank rzb);
*/
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
    /**
     * 文件上传
     * @param file
     * @param dirPath
     * @return
     */
    ResultMessage upload(MultipartFile file, String dirPath);
}
