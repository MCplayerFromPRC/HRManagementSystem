package com.cc.controller;

import com.cc.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Resource
    private EmployeeService es;
}
