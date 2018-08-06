package com.cc.controller;

import com.cc.model.*;
import com.cc.service.*;
import com.cc.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private GuestService gs;
    @Resource
    private AdminService as;
    @Resource
    private RecruitInfoService ris;
    @Resource
    private InterviewService is;
    @Resource
    private ResumeService rs;
    @Resource
    private EmployeeService es;
    @Resource
    private DepartmentService  ds;
    @Resource
    private JobService js;
    @Resource
    private TrainService ts;

    @RequestMapping("/getrecruitinfofirstpage")
    public ModelAndView getRecruitInfoFirstPage(HttpServletRequest request){
        List<RecruitInfo> recruitInfos=ris.getByNotRevoke(0);
        ModelAndView mv=new ModelAndView();
        request.getSession().setAttribute("ad_iv_pageNum",recruitInfos.size());
        mv.addObject("recruitInfo",recruitInfos.get(0));
        mv.addObject("page",1);
        mv.setViewName("admin/resumelist");
        return mv;
    }

    @RequestMapping("/getrecruitinfobypage")
    public ModelAndView getRecruitInfoByPage(HttpServletRequest request,int pg,int revoke){
        RecruitInfo recruitInfo=ris.getByPageAndNotRevoke(pg,pg,revoke).get(0);
        ModelAndView mv=new ModelAndView();
        mv.addObject("recruitInfo",recruitInfo);
        mv.addObject("page",pg);
        mv.setViewName("admin/resumelist");
        return mv;
    }

    @RequestMapping("/updateinterview1state")
    public ModelAndView updateInterview1State(HttpServletRequest request,int id){
        Interview interview=is.getInterviewById(id);
        interview.setState(1);
        is.update(interview);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/resumelist");
        return mv;
    }

    @RequestMapping("/updateinterview2state")
    public ModelAndView updateInterview2State(HttpServletRequest request,int id,String ivtime){
        Interview interview=is.getInterviewById(id);
        interview.setState(2);
        interview.setIvtime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(ivtime));
        interview.setInviteTime(DateUtil.getSqlDate());
        is.update(interview);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getrecruitinfofirstpage");
        return mv;
    }

    @RequestMapping("/getinterview3state")
    public ModelAndView getInterview3State(){
        List<Interview> interviews=is.getInterviewByState(3);
        ModelAndView mv=new ModelAndView();
        mv.addObject("interviews",interviews);
        mv.setViewName("admin/recruitguest");
        return mv;
    }

    @RequestMapping("/recruitguest")
    public ModelAndView recruitGuest(int id, Employee employee, BindingResult bindingResult, String job, String train){
        Interview interview=is.getInterviewById(id);
        interview.setState(6);
        employee.setId(0);
        is.update(interview);
        es.insert(employee);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getinterview3state");
        return mv;
    }

    @RequestMapping("/eliminateguest")
    public @ResponseBody String eliminateGuest(int id){
        Interview interview=is.getInterviewById(id);
        interview.setState(5);
        is.update(interview);
        return id+"";
    }

    @RequestMapping("/getalldepartment")
    public ModelAndView getAllDepartment(HttpSession session){
        List<Department> departments=ds.getByState(0);
        ModelAndView mv=new ModelAndView();
        session.setAttribute("ad_de_pageNum",departments.size());
        mv.addObject("department",departments.get(0));
        mv.addObject("page",1);
        mv.setViewName("admin/departmentlist2");
        return mv;
    }

    @RequestMapping("/getdepartmentbypage")
    public ModelAndView getDepartmentByPage(HttpServletRequest request,int pg){
        Department departments=ds.getByPageAndState(pg,0);
        ModelAndView mv=new ModelAndView();
        mv.addObject("department",departments);
        mv.addObject("page",pg);
        mv.setViewName("admin/departmentlist2");
        return mv;
    }

    @RequestMapping("/dlistupdatedepartment")
    public ModelAndView dlistUpdateDepartment(Department department){
        ds.update(department);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistinsertdepartment")
    public ModelAndView dlistInsertDepartment(Department department){
        department.setCreateTime(DateUtil.getSqlDate());
        ds.insert(department);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistdeletedepartment")
    public ModelAndView dlistDeleteDepartment(Department department){
        ds.delete(department);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistupdatejob")
    public ModelAndView dlistUpdateJob(Job job){
        js.update(job);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistinsertjob")
    public ModelAndView dlistInsertJob(Job job){
        js.insert(job);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistdeletejob")
    public ModelAndView dlistDeleteJob(Job job){
        js.delete(job);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistupdateemployee")
    public ModelAndView dlistUpdateEmployee(Employee employee){
        es.update(employee);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistinsertemployee")
    public ModelAndView dlistInsertEmployee(Employee employee){
        es.insert(employee);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/dlistdeleteemployee")
    public ModelAndView dlistDeleteEmployee(Employee employee){
        es.delete(employee);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalldepartment");
        return mv;
    }

    @RequestMapping("/getallemployee")
    public ModelAndView getAllEmployee(HttpSession session){
        List<Employee> employees=es.getAll();
        int ad_emp_pageNum=employees.size()%5==0?employees.size()/5:employees.size()/5+1;
        ModelAndView mv=new ModelAndView();
        session.setAttribute("ad_emp_pageNum",ad_emp_pageNum);
        mv.addObject("employees",es.getByPage(1,5));
        mv.addObject("page",1);
        mv.setViewName("admin/employeelist");
        return mv;
    }

    @RequestMapping("/getemployeebypage")
    public ModelAndView getEmployeeByPage(HttpServletRequest request,int pg){
        List<Employee> employees=es.getByPage((pg-1)*5+1,pg*5);
        ModelAndView mv=new ModelAndView();
        mv.addObject("employees",employees);
        mv.addObject("page",pg);
        mv.setViewName("admin/employeelist");
        return mv;
    }

    @RequestMapping("/getdepartmentjobcontact")
    public @ResponseBody  List<Department> getDepartmentJobContact(int state){
        return ds.getByState(state);
    }

    @RequestMapping("/getalltrain")
    public ModelAndView getAllTrain(HttpServletRequest request){
        List<Integer> states=new ArrayList<>();
        states.add(2);
        states.add(4);
        List<Train> trains=ts.getByNotState(states);
        ModelAndView mv=new ModelAndView();
        mv.addObject("trains",trains);
        mv.addObject("nowTime",new Timestamp(DateUtil.getSqlDate().getTime()));
        mv.setViewName("admin/trainrelease");
        return mv;
    }

    @RequestMapping("/updatetrain")
    public ModelAndView updateTrain(Train train,String startTime,String endTime){
        train.setStartTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(startTime));
        train.setEndTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(endTime));
        ts.update(train);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalltrain");
        return mv;
    }

    @RequestMapping("/releasetrain")
    public ModelAndView releaseTrain(Train train,String startTime,String endTime){
        train.setStartTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(startTime));
        train.setEndTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(endTime));
        train.setState(1);
        train.setReleaseTime(DateUtil.getSqlDate());
        ts.update(train);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalltrain");
        return mv;
    }

    @RequestMapping("/changestatetrain")
    public ModelAndView changeStateTrain(Train train){
        Train train1=ts.getById(train.getId());
        train1.setState(train.getState());
        if (train.getState()==1){
            train1.setReleaseTime(DateUtil.getSqlDate());
        }
        ts.update(train1);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalltrain");
        return mv;
    }

    @RequestMapping("/inserttrain")
    public ModelAndView insertTrain(Train train,String startTime,String endTime){
        train.setStartTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(startTime));
        train.setEndTime(DateUtil.javaStringFormDateTimeLocalFormatToDataBaseVarchar(endTime));
        ts.insert(train);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getalltrain");
        return mv;
    }

    @RequestMapping("/getrecruitinfoformanagement")
    public ModelAndView getRecruitInfoForManagement(HttpServletRequest request){
        List<RecruitInfo> recruitInfos=ris.getAll();
        int ad_ri_pageNum=recruitInfos.size()%5==0?recruitInfos.size()/5:recruitInfos.size()/5+1;
        ModelAndView mv=new ModelAndView();
        request.getSession().setAttribute("ad_ri_pageNum",ad_ri_pageNum);
        mv.addObject("recruitInfos",recruitInfos.subList(0,5));
        mv.addObject("page",1);
        mv.setViewName("admin/recruitinfolist");
        return mv;
    }

    @RequestMapping("/getrecruitinfomanagementbypage")
    public ModelAndView getRecruitInfoManagementByPage(HttpServletRequest request,int pg){
        List<RecruitInfo> recruitInfos=ris.getByPage((pg-1)*5+1,pg*5);
        ModelAndView mv=new ModelAndView();
        mv.addObject("recruitInfos",recruitInfos);
        mv.addObject("page",pg);
        mv.setViewName("admin/recruitinfolist");
        return mv;
    }

    @RequestMapping("/updaterecruitinfo")
    public ModelAndView updateRecruitInfo(RecruitInfo recruitInfo){
        ris.update(recruitInfo);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getrecruitinfoformanagement");
        return mv;
    }

    @RequestMapping("/insertrecruitinfo")
    public ModelAndView insertRecruitInfo(RecruitInfo recruitInfo){
        ris.insert(recruitInfo);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getrecruitinfoformanagement");
        return mv;
    }

    @RequestMapping("/deleterecruitinfo")
    public ModelAndView DeleteRecruitInfo(RecruitInfo recruitInfo){
        ris.delete(recruitInfo);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("forward:getrecruitinfoformanagement");
        return mv;
    }
}
