package com.cc.configuration;

import com.cc.interceptor.AdminInterceptor;
import com.cc.interceptor.EmployeeInterceptor;
import com.cc.interceptor.GuestInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootConfiguration
public class MySpringMVCConfig extends WebMvcConfigurerAdapter {
    @Autowired
    private GuestInterceptor guestInterceptor;
    @Autowired
    private EmployeeInterceptor employeeInterceptor;
    @Autowired
    private AdminInterceptor adminInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(guestInterceptor).addPathPatterns("/**");
        registry.addInterceptor(employeeInterceptor).addPathPatterns("/**");
        registry.addInterceptor(adminInterceptor).addPathPatterns("/**");
    }
}
