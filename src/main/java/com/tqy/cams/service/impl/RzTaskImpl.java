package com.tqy.cams.service.impl;

import com.activiti.base.entity.common.ResultMessage;
import com.activiti.base.service.ITaskService;
import com.activiti.base.util.HessianServiceFactory;
import com.tqy.cams.bean.*;
import com.tqy.cams.bean.common.BaseStatic;
import com.tqy.cams.dao.RzTaskMapper;
import com.tqy.cams.service.RzTaskService;
import com.tqy.cams.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 认证办理
 **/
@Service
public class RzTaskImpl implements RzTaskService {
    private final Logger logger = LoggerFactory.getLogger(RzTaskImpl.class);

    private static ITaskService taskService = null;
    static {
        taskService = HessianServiceFactory.getService(ITaskService.class,BaseStatic.ACTIVITI_SERVER_URL);
    }


    @Autowired
    private RzTaskMapper rzTaskMapper;

    @Override
    public ResultMessage saveRzTask(RzTask rz){
        //新用户进来为空 uuid 生成一个随机的id
        if(rz.getId()==null) {
            rz.setId(StringUtil.getCharAndNumr(6).toString());
                //生成id后，直接将信息存入数据库
                rzTaskMapper.saveRzTask(rz);
                logger.info("保存任务成功");
                return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存任务成功");

        }else if(rz.getId()==null){
            //当id不为null时 就可进行修改逻辑，根据id找到数据并且修改

            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "修改任务成功");
        }

        return new ResultMessage(BaseStatic.ERROR_CODE,"失败");


    }



}
