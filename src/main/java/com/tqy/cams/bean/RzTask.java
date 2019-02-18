package com.tqy.cams.bean;

import com.activiti.base.entity.ITask;

import java.io.Serializable;

public class RzTask extends ITask implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;   //测试任务id
	private String taskName;  //测试任务名称
	private String systemName;  //关联系统名称
	private String businessType;  //业务类型
	private String managerDept; //系统管理单位
	private String developDept; //研制单位
	private byte[] testPlan;  //测试计划
	private byte[] testReport; //测试报告

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
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

	public byte[] getTestPlan() {
		return testPlan;
	}

	public void setTestPlan(byte[] testPlan) {
		this.testPlan = testPlan;
	}

	public byte[] getTestReport() {
		return testReport;
	}

	public void setTestReport(byte[] testReport) {
		this.testReport = testReport;
	}


}
