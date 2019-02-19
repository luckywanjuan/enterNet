package com.tqy.cams.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.tqy.cams.interceptor.LoginInterceptor;

@Configuration
public class LoginConfiguration implements WebMvcConfigurer{
	
	@Autowired
    private LoginInterceptor loginInterceptor;
	
	//用来配置静态资源，比如html，js，css，等等
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	}
	 
    //用来注册拦截器，我们自己写好的拦截器需要通过这里添加注册才能生效
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration loginRegistry = registry.addInterceptor(loginInterceptor);
        // 拦截路径,	/** 表示拦截所有的请求，
        loginRegistry.addPathPatterns("/**").excludePathPatterns("/","/assets/**");;
    }

}
