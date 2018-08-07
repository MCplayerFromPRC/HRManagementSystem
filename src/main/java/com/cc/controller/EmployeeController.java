package com.cc.controller;

import com.cc.model.Department;
import com.cc.model.RecruitInfo;
import com.cc.service.DepartmentService;
import com.cc.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Resource
    private EmployeeService es;
    @Resource
    private DepartmentService ds;

    @RequestMapping("/getcompanyinfo")
    public ModelAndView getCompanyInfo(HttpSession session){
        List<Department> departments=ds.getByState(0);
        ModelAndView mv=new ModelAndView();
        session.setAttribute("ad_de_pageNum",departments.size());
        mv.addObject("department",departments.get(0));
        mv.addObject("page",1);
        mv.setViewName("employee/companyinfo");
        return mv;
    }

    @RequestMapping("/getcompanybypage")
    public ModelAndView getCompanyByPage(HttpServletRequest request,int pg){
        Department departments=ds.getByPageAndState(pg,0);
        ModelAndView mv=new ModelAndView();
        mv.addObject("department",departments);
        mv.addObject("page",pg);
        mv.setViewName("employee/companyinfo");
        return mv;
    }
}
