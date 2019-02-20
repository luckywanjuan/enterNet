package com.tqy.cams.bean;

import com.activiti.base.entity.ITask;

import java.io.Serializable;

public class TestPoint extends ITask implements Serializable{
	private static final long serialVersionUID = 1L;
   private  String id;  //id
   private String point; //要点内容
   private String affiliationId;  //归属外键id
	private  String pointName; //要点名称
	private  String testType; //测试类型
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

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getAffiliationId() {
		return affiliationId;
	}

	public void setAffiliationId(String affiliationId) {
		this.affiliationId = affiliationId;
	}

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
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
