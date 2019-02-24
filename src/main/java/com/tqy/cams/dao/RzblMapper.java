package com.tqy.cams.dao;

import com.activiti.base.entity.DelegateInfo;
import com.activiti.base.entity.IProcess;
import com.tqy.cams.bean.MyProcInst;
import com.tqy.cams.bean.MyTaskInst;
import com.tqy.cams.bean.RzApplication;
import com.tqy.cams.bean.RzCheckRz;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 入网认证
 */
public interface RzblMapper {
	
	List<RzApplication> getMyTaskByPage(Map<String, Object> map);

    int saveRzApplication(RzApplication rz);
    
    RzApplication getAttachmentbyId(@Param("applicationId") String applicationId);
    
    int queryCount(@Param("systemName") String systemName, @Param("managerDept") String managerDept,
                   @Param("developDept") String developDept, @Param("userId") String userId);

    List<RzApplication> queryRzAppByCondition(@Param("start") int start, @Param("end") int end,
                                              @Param("systemName") String systemName, @Param("managerDept") String managerDept,
                                              @Param("developDept") String developDept, @Param("userId") String userId);

    int queryAllCount();

    List<RzApplication> queryNoCheckRzApp(@Param("start") int start, @Param("end") int end);

    List<RzApplication> queryAllRzApp(@Param("start") int start, @Param("end") int end, @Param("systemName") String systemName,
                                      @Param("managerDept") String managerDept, @Param("developDept") String developDept);

    RzApplication getRzApplicationById(@Param("id") String id);

    int updateRzApplication(RzApplication rz);
    
    int saveCheckRzApplication(RzCheckRz check);

    RzCheckRz getCheckRzApplicationById(@Param("applicationId") String applicationId);

    int updateCheckRzApplication(RzCheckRz check);
    
    List<MyProcInst> getMyApplicationByPage(Map<String, Object> map);

    List<MyTaskInst> queryHiTaskAllByPage(Map<String, Object> map);
    
    List<IProcess> queryStartupProcess(Map<String, Object> map);

    List<DelegateInfo> queryDelegateInfoListByPage(List<DelegateInfo> list);

}
