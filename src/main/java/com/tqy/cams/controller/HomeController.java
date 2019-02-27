package com.tqy.cams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	/**
     * 登录
     * @return
     */
	@GetMapping("/index")
    public String index() {
    	return "pages/login/login";
    }

    @RequestMapping("/sq")
	@ResponseBody
    public String test(){
		return "test success!";
	}
}
