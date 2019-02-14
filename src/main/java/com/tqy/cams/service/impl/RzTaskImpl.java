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

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 任务创建
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
            rz.setId(UUID.randomUUID().toString());
                //生成id后，直接将信息存入数据库
                rzTaskMapper.saveRzTask(rz);
                logger.info("保存任务成功");
                return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存任务成功");

        }

        return new ResultMessage(BaseStatic.ERROR_CODE,"失败");


    }
   @Override
   public ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept){
      //创建一个map
       Map<String,Object> resultMap = new HashMap<>();
       //对象接 mapper 返回的数据
       RzTask rzTask = rzTaskMapper.getRzTask(taskName,systemName,developDept,managerDept);
       //装入map中
           resultMap.put("RzTask",rzTask);
           //将map返回给前端
       logger.info("查询任务成功");
       return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);


      //  RzTask rzs = rzTaskMapper.getRzTask(rz,taskName,systemName,developDept,managerDept);

       //return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",rzs);

   }
   @Override
    public ResultMessage getRzTaskMsg(String id){
       if(id!=null){
           Map<String,Object> resultMap = new HashMap<>();
           RzTask rzTask =rzTaskMapper.getRzTaskMsg(id);
           resultMap.put("RzTask",rzTask);
           logger.info("查询任务成功");
           return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);
       }
       logger.info("查询任务失败");
       return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
    }
    @Override
    public ResultMessage updateRzTaskMsg(RzTask rz,String id){
        if(id!=null){
           /* Map<String,Object> resultMap = new HashMap<>();
            int rzTask =rzTaskMapper.updateRzTask(rz,id);
            resultMap.put("RzTask",rzTask);*/
            rzTaskMapper.updateRzTask(rz);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
        logger.info("修改任务失败");
        return new ResultMessage(BaseStatic.ERROR_CODE,"失败"+id+"~"+rz);
    }

}
