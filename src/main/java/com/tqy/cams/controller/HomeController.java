package com.tqy.cams.controller;

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
        return "redirect:pages/login/login.jsp";
    }

}
