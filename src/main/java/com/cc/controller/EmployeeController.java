package com.cc.controller;

import com.cc.model.*;
import com.cc.service.AttendanceService;
import com.cc.service.DepartmentService;
import com.cc.service.EmployeeService;
import com.cc.service.RewardsService;
import com.cc.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Resource
    private EmployeeService es;
    @Resource
    private DepartmentService ds;
    @Resource
    private AttendanceService attends;
    @Resource
    private RewardsService res;

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

    @RequestMapping("/announceattendance")
    public ModelAndView announceAttendance(HttpSession session,int empid){
        Attendance attendance=new Attendance();
        attendance.setEmpid(empid);
        attendance.setStartTime(DateUtil.getSqlDate());
        attendance.setState(0);
        attends.insert(attendance);
        Employee employee= (Employee) session.getAttribute("employee");
        employee.setAttendance(attendance);
        session.setAttribute("employee",employee);
        ModelAndView mv=new ModelAndView();
        mv.addObject("attendance",attendance);
        mv.setViewName("employee/announceclock");
        return mv;
    }

    @RequestMapping("/offdutyattendance")
    public ModelAndView offDutyAttendance(HttpSession session,int empid){
        Attendance attendance=attends.getByEmpidAndStartLike(empid+"",DateUtil.getSqlDateString().substring(0,10));
        attendance.setEndTime(DateUtil.getSqlDate());
        attends.update(attendance);
        Employee employee= (Employee) session.getAttribute("employee");
        employee.setAttendance(attendance);
        session.setAttribute("employee",employee);
        ModelAndView mv=new ModelAndView();
        mv.addObject("attendance",attendance);
        mv.setViewName("employee/announceclock");
        return mv;
    }

    @RequestMapping("/getemployeerewards")
    public ModelAndView getEmployeeRewards(int empid){
        Rewards rewards=new Rewards();
        rewards.setEmpid(empid);
        rewards.setState(3);
        List<Rewards> rewardss=res.getByEmpidAndNotState(rewards);
        ModelAndView mv=new ModelAndView();
        mv.addObject("rewardss",rewardss);
        mv.setViewName("employee/rewardslist");
        return mv;
    }

    @RequestMapping("/updateemployeeinfo")
    public ModelAndView updateEmployeeInfo(HttpServletRequest request,HttpSession session, Employee employee){
        es.update(employee);
        employee.setAttendance(attends.getByEmpidAndStartLike(employee.getId()+"",
                DateUtil.getSqlDateString().substring(0,10)));
        session.setAttribute("employee",employee);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("employee/employeeinfo");
        return mv;
    }

    @RequestMapping("/getattendancebystate")
    public ModelAndView getAttendanceByState(Attendance attendance){
        List<Attendance> attendances=attends.getByEmpidAndState(attendance);
        ModelAndView mv=new ModelAndView();
        mv.addObject("attendances",attendances);
        mv.setViewName("employee/attendancelist");
        return mv;
    }
}
