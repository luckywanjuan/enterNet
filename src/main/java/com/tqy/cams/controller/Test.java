package com.tqy.cams.controller;

import com.activiti.base.service.IHistoryService;
import com.activiti.base.util.HessianServiceFactory;
import com.tqy.cams.bean.common.BaseStatic;
import com.tqy.cams.service.RzblService;
import com.tqy.cams.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

@Controller
@RequestMapping("test")
public class Test {
	
    
    @Autowired
    private RzblService rzblService;

    @RequestMapping("")
    public void test(){
        IHistoryService historyService = HessianServiceFactory.getService(IHistoryService.class, BaseStatic.ACTIVITI_SERVER_URL);
        byte[] data = historyService.getActivitiImageByte("85f653cdb6bf4d5eb827aa7bc6a4e358",true);
        String path = "D:/";
        try{ 
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            FileImageOutputStream imageOutput = new FileImageOutputStream(new File(path +"123.png"));
            imageOutput.write(data, 0, data.length);
            imageOutput.close();
            System.out.println("图片地址: " + path);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 展示流程图
     *//*
    @RequestMapping("showImg")
    public void showImg(String prciId, String procDefId, HttpServletResponse response){
    	rzblService.showImg(prciId,procDefId,response);
    }*/
    
}
