package com.tqy.cams.controller;

import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.*;
import com.tqy.cams.service.RzTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证测试
 **/
@RestController
@RequestMapping("rztask")
public class RzTaskController {


    @Autowired
    private RzTaskService rzTaskService;

    /**
     * 添加任务
     */
    @RequestMapping("saveRzTask")
    public ResultMessage saveRzTask(RzTask rz){
        return rzTaskService.saveRzTask(rz);
    }

    /**
     * 根据条件查询
     * @param taskName
     * @param systemName
     * @param developDept
     * @param managerDept
     * @return
     */
   @RequestMapping("getRzTask")
    public ResultMessage getRzTask(String taskName,String systemName,String developDept,String managerDept,String page, String limit){
        return rzTaskService.getRzTask(taskName,systemName,developDept,managerDept,page,limit);
    }

    /**
     * 根据id查询详细数据
     * @param id
     * @return
     */
    @RequestMapping("getRzTaskMsg")
    public ResultMessage getRzTaskMsg(String id){
        return rzTaskService.getRzTaskMsg(id);
    }
     /**
     * 根据id修改详细数据
     * @param
     * @return
     */
    @RequestMapping("updateRzTaskMsg")
    public ResultMessage updateRzTaskMsg(RzTask rz){
        return rzTaskService.saveRzTask(rz);
    }
    /**
     * 保存添加计划
     */
    @RequestMapping("saveRzPlan")
    public ResultMessage saveRzTask(RzPlan rzp){
        return rzTaskService.saveRzPlan(rzp);
    }

    /**
     * 根据test_name查询详细数据
     * @param
     * @return
     */
    @RequestMapping("getRzPlanMsg")
    public ResultMessage getRzPlanMsg(String id){
        return rzTaskService.getRzPlanMsg(id);
    }

    /**
     * 测试报告生成
     */
    @RequestMapping("saveRzReport")
    public ResultMessage saveRzReport(RzReport rzr){
        return rzTaskService.saveRzReport(rzr);
    }
    /**
     * 根据id修改详细数据
     * @param
     * @return
     */
    @RequestMapping("updateRzReport")
    public ResultMessage updateRzReport(RzReport rzr){
        return rzTaskService.saveRzReport(rzr);
    }

    /**
     * 新建要点内容
     */
    @RequestMapping("savePoint")
    public ResultMessage savePoint(TestPoint tp){
        return rzTaskService.saveTestPoint(tp);
    }
    /**
     * 根据id修改要点内容
     * @param
     * @return
     */
    @RequestMapping("updatePoint")
    public ResultMessage updatePoint(TestPoint tp){
        return rzTaskService.saveTestPoint(tp);
    }
    /**
     * 新建要点内容库
     */

    @RequestMapping("getPoint")
    public ResultMessage getRzPoint(String id){
        return rzTaskService.getTestPoint(id);
    }

   /* @RequestMapping("saveRzBank")
    public ResultMessage saveRzBank(RzBank rzb){
        return rzTaskService.saveRzBank(rzb);
    }*/
   @RequestMapping("getAllPoint")
   public ResultMessage getAllPoint(){
       return rzTaskService.getAllPoint();
   }

    /**  文件上传
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/fileUpload")
    public ResultMessage handleFormUpload(MultipartFile file, HttpServletRequest request) {
        //设置上传文件的保存地址目录
        String dirPath = request.getServletContext().getRealPath("/upload/");
        return rzTaskService.upload(file,dirPath);
    }
}
