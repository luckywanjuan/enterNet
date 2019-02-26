package com.tqy.cams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	/**
     * 登录
     * @return
     */
	@GetMapping("/index")
    public ModelAndView index() {
    	return new ModelAndView("pages/login/login");
    }
    
}
