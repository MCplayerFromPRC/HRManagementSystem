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

    @RequestMapping("/getrecruitinfofirstpage")
    public ModelAndView getRecruitInfoFirstPage(HttpServletRequest request){
        List<RecruitInfo> recruitInfos=ris.getByRevoke(0);
        ModelAndView mv=new ModelAndView();
        request.getSession().setAttribute("ad_iv_pageNum",recruitInfos.size());
        mv.addObject("recruitInfo",recruitInfos.get(0));
        mv.addObject("page",1);
        mv.setViewName("admin/resumelist");
        return mv;
    }

    @RequestMapping("/getrecruitinfobypage")
    public ModelAndView getRecruitInfoByPage(HttpServletRequest request,int pg,int revoke){
        RecruitInfo recruitInfo=ris.getByPage(pg,pg,revoke).get(0);
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
}
