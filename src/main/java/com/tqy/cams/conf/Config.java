package com.tqy.cams.conf;

import com.tqy.cams.filter.DomainFilter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class Config {
	
	@Bean
    public FilterRegistrationBean<DomainFilter> filterRegistrationBean() {
        FilterRegistrationBean<DomainFilter> registrationBean = new FilterRegistrationBean<DomainFilter>();
        DomainFilter domainFilter = new DomainFilter();
        registrationBean.setFilter(domainFilter);
        List<String> urlPatterns = new ArrayList<String>();
        urlPatterns.add("/*");
        registrationBean.setUrlPatterns(urlPatterns);
        return registrationBean;
    }
	
}
