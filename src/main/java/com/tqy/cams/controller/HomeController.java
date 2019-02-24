package com.tqy.cams.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	/**
     * 登录
     * @return
     */
    @RequestMapping("/")
    public String index() {
    	return "pages/login/login";
    }
    
    /**
     * 注销登录
     *
     * @param request
     * @return
     */
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request) {
    	request.getSession().removeAttribute("loginName");
        return "redirect:/";
    }

}
