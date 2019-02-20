package com.tqy.cams.service.impl;

import com.activiti.base.entity.common.PageResult;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            rz.setId(StringUtil.getUUID());
            rz.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
                //生成id后，直接将信息存入数据库
                rzTaskMapper.saveRzTask(rz);
                logger.info("保存任务成功"+rz.getTaskName());
                return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存任务成功");

        }else{
            rz.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
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
           start = Integer.parseInt(pageNo) * Integer.parseInt(pageSize);
           end = Integer.parseInt(pageSize);
       }else{
           end = totalSize;
       }
       List<RzTask> info = rzTaskMapper.getRzTask(taskName,systemName,managerDept,developDept,start, end);

       PageResult rs = new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);
       return rs;
      /* List<RzTask> info = new ArrayList<RzTask>();
       info = rzTaskMapper.getRzTask(taskName,systemName,developDept,managerDept);
*/
    /*    //创建一个map
       Map<String,Object> resultMap = new HashMap<>();
       //对象接 mapper 返回的数据
       List rzTask = rzTaskMapper.getRzTask(taskName,systemName,developDept,managerDept);
       //装入map中
       resultMap.put("RzTask",rzTask);
           //将map返回给前端
       logger.info("查询任务成功");*/
  /*     return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);

*/
   }
   @Override
    public PageResult getRzTaskMsg(String id){
       if(id!=null){

           List<RzTask> info = new ArrayList<RzTask>();
           info = rzTaskMapper.getRzTaskMsg(id);
           return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);

         /*  Map<String,Object> resultMap = new HashMap<>();
           RzTask rzTask =rzTaskMapper.getRzTaskMsg(id);
           resultMap.put("RzTaskMsg",rzTask);
           logger.info("查询任务成功");
           return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
       }
       logger.info("查询任务失败");
     //  return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
       return new PageResult(BaseStatic.ERROR_CODE, "失败");
    }

    public ResultMessage saveRzPlan(RzPlan rzp){
        //新用户进来为空 uuid 生成一个随机的id
        if(rzp.getId()==null) {
            rzp.setId(StringUtil.getUUID());
            rzp.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            //生成id后，直接将信息存入数据库
            rzTaskMapper.saveRzPlan(rzp);
            logger.info("保存计划成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存计划成功");

        }

        return new ResultMessage(BaseStatic.ERROR_CODE,"保存计划失败");


    }
    public PageResult getRzPlanMsg(String id){
        if(id!=null){

            List<RzPlan> info = new ArrayList<RzPlan>();
            info = rzTaskMapper.getRzPlanMsg(id);
            return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);

         /*  Map<String,Object> resultMap = new HashMap<>();
           RzTask rzTask =rzTaskMapper.getRzTaskMsg(id);
           resultMap.put("RzTaskMsg",rzTask);
           logger.info("查询任务成功");
           return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
        }
        logger.info("查询任务失败");
        //  return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
        return new PageResult(BaseStatic.ERROR_CODE, "失败");



      /*
        Map<String,Object> resultMap = new HashMap<>();
        RzPlan rzp = rzTaskMapper.getRzPlanMsg(id);
        resultMap.put("RzPlanMsg",rzp);
        logger.info("查询任务成功"+id);
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
    }
    public ResultMessage saveRzReport(RzReport rzr){
        //新用户进来为空 uuid 生成一个随机的id
        if(rzr.getId()==null) {
            rzr.setId(StringUtil.getUUID());
            //生成id后，直接将信息存入数据库
            rzr.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            rzTaskMapper.saveRzReport(rzr);
            logger.info("保存测试报告成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存测试报告成功");

        }else{
            rzr.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            rzTaskMapper.updateRzReport(rzr);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");

        }

    }
  /*  public  ResultMessage updateRzReport(RzReport rzr,String id){
        if(id!=null){
           *//* Map<String,Object> resultMap = new HashMap<>();
            int rzTask =rzTaskMapper.updateRzTask(rz,id);
            resultMap.put("RzTask",rzTask);*//*
            rzTaskMapper.updateRzReport(rzr);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
        logger.info("修改任务失败");
        return new ResultMessage(BaseStatic.ERROR_CODE,"失败"+id+"~");
    }*/
    public ResultMessage saveTestPoint(TestPoint tp){
        //新用户进来为空 uuid 生成一个随机的id
        if(tp.getId()==null) {
            tp.setId(StringUtil.getUUID());
            //生成id后，直接将信息存入数据库
            tp.setCreateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            rzTaskMapper.savePoint(tp);
            logger.info("保存测试报告成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存要点测试内容成功");

        }else{
            tp.setUpdateTime(StringUtil.getTimeStamp("yyyy-MM-dd HH:mm:ss"));
            rzTaskMapper.updatePoint(tp);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }

    }
    /*public ResultMessage updateTestPoint(TestPoint tp,String id){
        if(id!=null){
           *//* Map<String,Object> resultMap = new HashMap<>();
            int rzTask =rzTaskMapper.updateRzTask(rz,id);
            resultMap.put("RzTask",rzTask);*//*
            rzTaskMapper.updatePoint(tp);
            logger.info("修改任务成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功");
        }
        logger.info("修改任务失败");
        return new ResultMessage(BaseStatic.ERROR_CODE,"失败"+id+"~");
    }*/
  /*  public ResultMessage saveRzBank(RzBank rzb){
        //新用户进来为空 uuid 生成一个随机的id
        if(rzb.getId()==null) {
            rzb.setId(StringUtil.getUUID());
            //生成id后，直接将信息存入数据库
            rzTaskMapper.saveRzBank(rzb);
            logger.info("保存测试报告成功");
            return new ResultMessage(BaseStatic.SUCCESS_CODE, "保存要点测试内容成功"+rzb.getId());

        }
        return new ResultMessage(BaseStatic.ERROR_CODE,"保存要点测试内容失败");
    }
*/

    public PageResult getTestPoint(String id){
        if(id!=null){
            List<TestPoint> info = new ArrayList<TestPoint>();
            info = rzTaskMapper.getPoint(id);
            return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);

         /*  Map<String,Object> resultMap = new HashMap<>();
           RzTask rzTask =rzTaskMapper.getRzTaskMsg(id);
           resultMap.put("RzTaskMsg",rzTask);
           logger.info("查询任务成功");
           return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
        }
        logger.info("查询任务失败");
        //  return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
        return new PageResult(BaseStatic.ERROR_CODE, "失败");
     /*   Map<String,Object> resultMap = new HashMap<>();
        TestPoint tp = rzTaskMapper.getPoint(id);
        resultMap.put("RzPlanMsg",tp);
        logger.info("查询任务成功"+id);
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
    }
    public PageResult getAllPoint(){
            List<TestPoint> info = new ArrayList<TestPoint>();
            info = rzTaskMapper.getAllPoint();
            return new PageResult(BaseStatic.SUCCESS_CODE, "成功", info);

         /*  Map<String,Object> resultMap = new HashMap<>();
           RzTask rzTask =rzTaskMapper.getRzTaskMsg(id);
           resultMap.put("RzTaskMsg",rzTask);
           logger.info("查询任务成功");
           return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
       /*
        logger.info("查询任务失败");
        //  return new ResultMessage(BaseStatic.ERROR_CODE,"失败");
        return new PageResult(BaseStatic.ERROR_CODE, "失败");*/


       /* Map<String,Object> resultMap = new HashMap<>();
        List<TestPoint> tp = rzTaskMapper.getAllPoint();
        resultMap.put("RzPlanMsg",tp);
        logger.info("查询任务成功");
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",resultMap);*/
    }
    /**
     * 文件上传
     * @param file
     * @param dirPath
     * @return
     */
    public ResultMessage upload(MultipartFile file, String dirPath){
        File filePath = new File(dirPath);
        //如果保存文件的地址不存在，就先创建目录
        if(!filePath.exists()) {
            filePath.mkdirs();
        }
        String path = "";
        try {
            //for(MultipartFile file: files) {
            //获取上传文件的原始名称
            String originalFilename = file.getOriginalFilename();
            //使用MultipartFile接口的方法完成文件上传到指定位置
            file.transferTo(new File(dirPath + originalFilename));
            path = dirPath + originalFilename + ",";
            //}
        }catch(Exception e) {
            logger.error("上传文件出错："+e.getMessage());
            return new ResultMessage(BaseStatic.ERROR_CODE,"失败",e.getMessage());
        }
        return new ResultMessage(BaseStatic.SUCCESS_CODE,"成功",path.substring(0, path.length()-1));
    }
}
