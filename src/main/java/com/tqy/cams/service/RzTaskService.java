package com.tqy.cams.service;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzTask;

/**
 * 认证办理
 **/
public interface RzTaskService {

    /**
     * 添加任务
     *
     */
    ResultMessage saveRzTask(RzTask rz);


}
