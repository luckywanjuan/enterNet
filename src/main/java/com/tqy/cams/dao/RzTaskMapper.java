package com.tqy.cams.dao;

import com.activiti.base.entity.DelegateInfo;
import com.activiti.base.entity.IProcess;
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
     * @param id
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
    RzTask getRzTask(String taskName,String systemName,String developDept,String managerDept);

    /**
     * 根据id查询详细数据
     * @param id
     * @return
     */
    RzTask getRzTaskMsg(String id);






}
