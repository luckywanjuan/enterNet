package com.tqy.cams.controller;

import com.activiti.base.entity.common.PageResult;
import com.activiti.base.entity.common.ResultMessage;
import com.tqy.cams.bean.RzApplication;
import com.tqy.cams.bean.RzCheckRz;
import com.tqy.cams.service.RzblService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证办理
 **/
@RestController
@RequestMapping("rzbl")
public class RzblController {

    @Autowired
    private RzblService rzblService;

    /**
     * 我的任务
     */
    @RequestMapping("queryMyTask")
    public PageResult queryMyTask(String userId, String processDefKey){
        return rzblService.queryMyTask(userId,processDefKey);
    }
    
    /**
     * 新增入网认证申请表单数据
     */
    @RequestMapping("updateRzApplication")
    public ResultMessage updateRzApplication(RzApplication rz,String prciId, String taskId) {
        return rzblService.updateRzApplication(rz,prciId,taskId);
    }

    /**
     * 获取入网认证申请表单数据
     */
    @RequestMapping("getRzApplication")
    public ResultMessage getRzApplication(String id) {
        return rzblService.getRzApplication(id);
    }
    
    /**
     * 新增入网认证审核表单数据
     */
    @RequestMapping("updateCheckRzApplication")
    public ResultMessage updateCheckRzApplication(RzCheckRz check, String prciId, String taskId) {
        return rzblService.updateCheckRzApplication(check, prciId,taskId);
    }

    /**
     * 获取入网认证审核表单数据
     */
    @RequestMapping("getCheckRzApplication")
    public ResultMessage getCheckRzApplication(String applicationId) {
        return rzblService.getCheckRzApplication(applicationId);
    }


    /**
     * 可发起的流程
     */
    @RequestMapping("queryStartupProcess")
    public PageResult queryStartupProcess(String userId){
        return rzblService.queryStartupProcess(userId);
    }

    /**
     * 启动流程
     */
    @RequestMapping("startProcess")
    public ResultMessage startProcess(String userId,String processDefKey,String buzId){
        return rzblService.startProcess(userId,processDefKey,buzId);
    }

    /**
     * 签收任务
     */
    @RequestMapping("claimTask")
    public ResultMessage claimTask(String taskId,String userId) {
        return rzblService.claimTask(taskId, userId);
    }

    /**
     * 取消签收任务
     */
    @RequestMapping("unclaimTask")
    public ResultMessage unclaimTask(String taskId) {
        return rzblService.unclaimTask(taskId);
    }

    /**
     * 发送任务
     */
    @RequestMapping("sendTask")
    public ResultMessage sendTask(String taskId,String userId,String result,String resultDesc) {
        return rzblService.sendTask(taskId, userId,result,resultDesc);
    }

    /**
     * 回退任务
     */
    @RequestMapping("backTask")
    public ResultMessage backTask(String taskId,String userId,String result,String resultDesc) {
        return rzblService.backTask(taskId, userId,result,resultDesc);
    }

    /**
     * 中止流程
     */
    @RequestMapping("deleteProcess")
    public ResultMessage deleteProcess(String prciId) {
        return rzblService.deleteProcess(prciId);
    }

    /**
     * 给流程实例设置业务id
     */
    @RequestMapping("setBusinessId")
    public ResultMessage setBusinessId(String prciId, String buzId) {
        return rzblService.setBusinessId(prciId, buzId);
    }

    /**
     * 设置流程变量
     */
    @RequestMapping("setVariables")
    public ResultMessage setVariables(String prciId) {
        return rzblService.setVariables(prciId);
    }

    /**
     * 获取流程变量
     */
    @RequestMapping("getVariables")
    public ResultMessage getVariables(String prciId) {
        return rzblService.getVariables(prciId);
    }


    @RequestMapping("getFootpoint")
    public ResultMessage getFootpoint(String prciId) {
        return rzblService.getFootpoint(prciId);
    }

    /**
     * 我的申请
     */
    @RequestMapping("myApplication")
    public PageResult myApplication(String userId, String processDefKey){
        return rzblService.myApplication(userId,processDefKey);
    }

    /**
     * 我的已办任务
     */
    @RequestMapping("queryHiTaskAll")
    public PageResult queryHiTaskAll(String userId){
        return rzblService.queryHiTaskAll(userId);
    }

    /**
     * 获取委托权限
     * @param userId
     * @return
     */
    @RequestMapping("getAuth")
    public ResultMessage getAuth(String userId) {
        return rzblService.getAuth(userId);
    }

    /**
     * 新增一条委托
     */
    @RequestMapping("addDelegate")
    public ResultMessage addDelegate(String jsonStr){
        return rzblService.addDelegate(jsonStr);
    }

    /**
     * 查询委托列表
     * @return
     */
    @RequestMapping("queryDelegateInfoList")
    public ResultMessage queryDelegateInfoList(HttpServletRequest request){
        String userId = request.getParameter("userId");
        return rzblService.queryDelegateInfoList(userId);
    }
    
    /**
     * 被委托人发送任务
     */
    @RequestMapping("sendTaskDelegate")
    public ResultMessage sendTaskDelegate(String taskId,String userId,String result,String resultDesc
    		,String delegater, String delegateId) {
        return rzblService.sendTaskDelegate(taskId, userId,result,resultDesc,delegater,delegateId);
    }
    
    /**
     * 删除委托
     * @param id
     * @return
     */
    @RequestMapping("deleteDelegate")
    public ResultMessage deleteDelegate(String id){
    	rzblService.deleteDelegate(id);
    	return new ResultMessage(0, "删除成功");
    }
    
    /**
     * 被委托人回退任务
     * @param taskId
     * @param userId
     * @param result
     * @param resultDesc
     * @param delegater
     * @param delegateId
     * @return
     */
    @RequestMapping("backTaskDelegate")
    public ResultMessage backTaskDelegate(String taskId,String userId,String result,String resultDesc
    		,String delegater, String delegateId) {
    	return rzblService.backTaskDelegate(taskId, userId, result, resultDesc, delegater, delegateId);
    }

    /**
     * 获取委托的业务规则
     */
    @RequestMapping("queryDelegateList")
    public ResultMessage queryDelegateList(String processDefId, String activityId) {
        return rzblService.queryDelegateList(processDefId,activityId);
    }

}
