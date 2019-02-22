package com.tqy.cams.dao;

import com.activiti.base.entity.DelegateInfo;
import com.activiti.base.entity.IProcess;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * 认证测试过程管理
 * @author zikkorn
 *
 */
public interface RzTaskMapper {
    /**
     * 保存任务表
     * @param rz
     * @return
     */
    int saveRzTask(RzTask rz);

    /**被 调2个方法调用 详细查看的编辑，创建新任务页面的修改
     * 根据id修改任务表
     * @param rz
     * @param
     * @return
     */
    int updateRzTask(RzTask rz);

    /**
     * 根据条件查询
     * @param
     * @param taskName
     * @param systemName
     * @param developDept
     * @param managerDept
     * @return
     */
    List<RzTask> getRzTask(@Param("taskName") String taskName,@Param("systemName") String systemName,@Param("developDept") String developDept,@Param("managerDept") String managerDept,@Param("start") int start, @Param("end") int end);

    List<RzTask> getRzTaskName();
    
    int queryCounts(@Param("taskName") String taskName,@Param("systemName") String systemName, @Param("managerDept") String managerDept,@Param("developDept") String developDept);
    /**
     * 根据id查询详细数据
     * @param id
     * @return
     */
    List<RzTask> getRzTaskMsg(String id);


    /**
     * 保存计划表
     * @param rzp
     * @return
     */
    int saveRzPlan(RzPlan rzp);

    /**
     * 获取2个参数---系统管理单位和研制单位
     * @param
     * @return
     */
    List<RzPlan> getRzPlanMsg(String id);

    /**
     * 创建测试报告
     * @param rzr
     * @return
     */
    int saveRzReport(RzReport rzr);

    /**
     *  根据测试报告任务id修改测试报告
     * @param
     * @return
     */

    int updateRzReport(RzReport rzr);

    /**
     * 保存新的要点内容
    * @param tp
     * @return
     */
    int savePoint(TestPoint tp);

    /**
     * 修改测试要点
     * @param tp
     * @return
     */
    int updatePoint(TestPoint tp);

    /**
     * 创建新的要点管理库
     * @param rzb
     * @return
     */
    /*int saveRzBank(RzBank rzb);*/

    /**
     * 根据id查找要点内容
     * @param
     * @return
     */
    List<TestPoint> getPoint(String id);

    /**
     * 获得所有的要点
     * @return
     */
    List<TestPoint> getAllPoint();
}
