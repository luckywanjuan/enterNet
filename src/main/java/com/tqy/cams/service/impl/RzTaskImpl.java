package com.tqy.cams.service.impl;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import com.tqy.cams.bean.common.BaseStatic;
import com.tqy.cams.dao.RzTaskMapper;
import com.tqy.cams.service.RzTaskService;
import com.tqy.cams.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 认证测试
 **/
@Service
public class RzTaskImpl implements RzTaskService {
    private final Logger logger = LoggerFactory.getLogger(RzTaskImpl.class);

    @Autowired
    private RzTaskMapper rzTaskMapper;

    @Override
    public ResultMessage saveRzTask(RzTask rz){
        //新用户进来为空 uuid 生成一个随机的id
        if(StringUtil.isNullOrBlank(rz.getId())) {
            rz.setId(StringUtil.getUUID());
            rz.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            //生成id后，直接将信息存入数据库
            rzTaskMapper.saveRzTask(rz);
            logger.info("保存任务成功"+rz.getTaskName());
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "成功");
        }else{
            rz.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            rzTaskMapper.updateRzTask(rz);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
    }
    
    @Override
    public PageResult getRzTask(String taskName,String systemName,String developDept,String managerDept,String pageNo, String pageSize){
       int totalSize = rzTaskMapper.queryCounts(taskName,systemName,managerDept,developDept);
       int start = 0;
       int end = 0;
       if(!StringUtil.isNullOrBlank(pageNo) && !StringUtil.isNullOrBlank(pageSize)){
           start = (Integer.parseInt(pageNo)-1) * Integer.parseInt(pageSize);
           end = Integer.parseInt(pageSize);
       }else{
           end = totalSize;
       }
       List<RzTask> info = rzTaskMapper.getRzTask(taskName,systemName,managerDept,developDept,start, end);
       return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);
    }
    
    @Override
    public ResultMessage getRzTaskName() {
    	List<RzTask> info = rzTaskMapper.getRzTaskName();
    	return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",info);
    }
    
    @Override
    public ResultMessage getRzTaskMsg(String id){
       if(!StringUtil.isNullOrBlank(id)){
           RzTask info = rzTaskMapper.getRzTaskMsg(id);
           return new ResultMessage(BaseStatic.SUCCESS_CODE, "成功", info);
       }
       logger.info("查询任务失败");
       return new ResultMessage(BaseStatic.ERROR_CODE, "失败");
    }

    public ResultMessage saveRzPlan(RzPlan rzp){
        //新用户进来为空 uuid 生成一个随机的id
        if(StringUtil.isNullOrBlank(rzp.getId())) {
            rzp.setId(StringUtil.getUUID());
            rzp.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            //生成id后，直接将信息存入数据库
            rzTaskMapper.saveRzPlan(rzp);
            logger.info("保存计划成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "成功");
        }
        return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
    }
    
    public ResultMessage saveRzReport(RzReport rzr){
        //新用户进来为空 uuid 生成一个随机的id
        if(StringUtil.isNullOrBlank(rzr.getId())) {
            rzr.setId(StringUtil.getUUID());
            //生成id后，直接将信息存入数据库
            rzr.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            rzTaskMapper.saveRzReport(rzr);
            logger.info("保存测试报告成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "成功");
        }else{
            rzr.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            rzTaskMapper.updateRzReport(rzr);
            logger.info("修改测试报告成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
    }
    
    public ResultMessage saveTestPoint(TestPoint tp){
        //新用户进来为空 uuid 生成一个随机的id
        if(StringUtil.isNullOrBlank(tp.getId())) {
            tp.setId(StringUtil.getUUID());
            //生成id后，直接将信息存入数据库
            tp.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            rzTaskMapper.savePoint(tp);
            logger.info("保存要点库成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "成功");
        }else{
            tp.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd"));
            rzTaskMapper.updatePoint(tp);
            logger.info("修改要点库成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
    }

    public PageResult getTestPoint(String id){
        if(StringUtil.isNullOrBlank(id)){
            List<TestPoint> info = new ArrayList<TestPoint>();
            info = rzTaskMapper.getPoint(id);
            return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);
        }
        logger.info("查询要点库失败");
        return new PageResult(BaseStatic.ERROR_CODE, "失败");
    }
    
    public PageResult getAllPoint(){
        List<TestPoint> info = new ArrayList<TestPoint>();
        info = rzTaskMapper.getAllPoint();
        return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);
    }
    
}
