package com.tqy.cams.dao;

import com.tqy.cams.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 认证测试过程管理
 */
public interface RzTaskMapper {
	
    /**
     * 保存任务表
     */
    int saveRzTask(RzTask rz);

    /**
     * 修改任务表
     */
    int updateRzTask(RzTask rz);

    /**
     * 根据条件查询
     */
    List<RzTask> getRzTask(@Param("taskName") String taskName,@Param("systemName") String systemName,@Param("developDept") String developDept,@Param("managerDept") String managerDept,@Param("start") int start, @Param("end") int end);

    /**
     * 获取测试任务名称分类
     */
    List<RzTask> getRzTaskName();
    
    int queryCounts(@Param("taskName") String taskName,@Param("systemName") String systemName, @Param("managerDept") String managerDept,@Param("developDept") String developDept);
   
    /**
     * 根据id查询详细数据
     */
    RzTask getRzTaskMsg(String id);

    /**
     * 保存计划表
     */
    int saveRzPlan(RzPlan rzp);

    /**
     * 创建测试报告
     */
    int saveRzReport(RzReport rzr);

    /**
     *  根据测试报告任务id修改测试报告
     */
    int updateRzReport(RzReport rzr);

    /**
     * 保存新的要点内容
     */
    int savePoint(TestPoint tp);

    /**
     * 修改测试要点
     */
    int updatePoint(TestPoint tp);

    /**
     * 根据id查找要点内容
     */
    List<TestPoint> getPoint(String id);

    /**
     * 获得所有的要点
     */
    List<TestPoint> getAllPoint();
}
