package com.tqy.cams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Component
public class LoginInterceptor implements HandlerInterceptor{

	/**
     * 在请求被处理之前调用
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 检查每个到来的请求对应的session域中是否有登录标识
        Object loginName = request.getSession().getAttribute("loginName");
        if (null == loginName || !(loginName instanceof String)) {
            // 未登录，重定向到登录页
            response.sendRedirect("/index");
            return true;
        }
        String userName = (String) loginName;
        System.out.println("当前用户已登录，登录的用户名为： " + userName);
        return true;
    }
    
	/**
     * 在请求被处理后，视图渲染之前调用
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }
 
	/**
     * 在整个请求结束后调用
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
    
   /* @Bean
    public WebMvcConfigurerAdapter customMvcConfigurerAdapter (){
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**");
                // 添加拦截器
                super.addInterceptors(registry);
            }
        };
    }*/
}
