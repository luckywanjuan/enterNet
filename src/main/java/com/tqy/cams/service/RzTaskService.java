package com.tqy.cams.service;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzTask;

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
    ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept);

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

}
