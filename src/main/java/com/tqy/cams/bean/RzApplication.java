package com.tqy.cams.bean;

import com.activiti.base.entity.ITask;

import java.io.Serializable;

/**
 * 入网认证申请
 * @author sunqian
 */
public class RzApplication extends ITask implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String id;			
	private String systemName;		//系统名称
	private String businessType;	//业务类型
	private String managerDept;		//系统管理单位
	private String developDept;		//研制单位
	private String applicationUserName;		//申请人姓名
	private String phone;			//手机号码
	private String email;			//电子邮箱
	private String createDate;		//申请日期
	private String attachment;		//电子附件
	private String remark;			//系统描述
	private String result;		//认证状态
	private String checkDate;	//审核时间
	private String userId;		//操作用户ID
	private byte[] file;//附件内容
	
    // 任务类型  0：我的任务，1：代办任务，2：被委托任务
    private int taskType;
    // 任务类型名称
    private String taskTypeName;
    
	public RzApplication() {
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public int getTaskType() {
		return taskType;
	}
	public void setTaskType(int taskType) {
		this.taskType = taskType;
	}
	public String getTaskTypeName() {
		return taskTypeName;
	}
	public void setTaskTypeName(String taskTypeName) {
		this.taskTypeName = taskTypeName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getManagerDept() {
		return managerDept;
	}
	public void setManagerDept(String managerDept) {
		this.managerDept = managerDept;
	}
	public String getDevelopDept() {
		return developDept;
	}
	public void setDevelopDept(String developDept) {
		this.developDept = developDept;
	}
	public String getApplicationUserName() {
		return applicationUserName;
	}
	public void setApplicationUserName(String applicationUserName) {
		this.applicationUserName = applicationUserName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
}
