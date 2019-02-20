package com.tqy.cams.bean;

import com.activiti.base.entity.ITask;

import java.io.Serializable;

public class RzReport extends ITask implements Serializable{
	private static final long serialVersionUID = 1L;
    private String id; //测试任务ID
	private String testName;  //测试任务名称
	private String managerDept; //系统管理单位
	private String developDept; //研制单位
	private byte[] testData;  //测试数据内容
	private String testPath;  //测试文件路径
	private String createTime;//创建时间
	private String updateTime;//修改时间
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
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

	public byte[] getTestData() {
		return testData;
	}

	public void setTestData(byte[] testData) {
		this.testData = testData;
	}

	public String getTestPath() {
		return testPath;
	}

	public void setTestPath(String testPath) {
		this.testPath = testPath;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
