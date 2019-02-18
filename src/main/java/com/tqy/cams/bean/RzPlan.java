package com.tqy.cams.bean;

import com.activiti.base.entity.ITask;

import java.io.Serializable;

public class RzPlan extends ITask implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id; //测试任务id
	private String taskName; //测试任务名称
	private String systemDept;  //系统管理单位
	private String developDept; //研制单位
	private String testType; //测试类型
	private Integer systemCheck;  //系统形式检查
	private Integer interfaceCheck;  //接口规范检查
	private String testPoint; //测试要点

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

	public String getSystemDept() {
		return systemDept;
	}

	public void setSystemDept(String systemDept) {
		this.systemDept = systemDept;
	}

	public String getDevelopDept() {
		return developDept;
	}

	public void setDevelopDept(String developDept) {
		this.developDept = developDept;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public Integer getSystemCheck() {
		return systemCheck;
	}

	public void setSystemCheck(Integer systemCheck) {
		this.systemCheck = systemCheck;
	}

	public Integer getInterfaceCheck() {
		return interfaceCheck;
	}

	public void setInterfaceCheck(Integer interfaceCheck) {
		this.interfaceCheck = interfaceCheck;
	}

	public String getTestPoint() {
		return testPoint;
	}

	public void setTestPoint(String testPoint) {
		this.testPoint = testPoint;
	}
}
