package com.cc.controller;

import com.cc.model.*;
import com.cc.service.*;
import com.cc.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class IndexController {
    @Resource
    private GuestService gs;
    @Resource
    private AdminService as;
    @Resource
    private EmployeeService es;
    @Resource
    private RecruitInfoService ris;
    @Resource
    private AttendanceService attends;

    @RequestMapping(value = {"/home","/"})
    public String home(){
        return "../../index";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpSession session,Guest guest,String identity){
        ModelAndView mv = new ModelAndView();
        if(identity.equals("guest")) {
            guest = gs.login(guest);
            if (guest != null) {
                session.setAttribute("guest", guest);
                session.removeAttribute("employee");
                session.removeAttribute("admin");
                mv.setViewName("guest/guestinfo");
            } else {
                session.removeAttribute("guest");
                mv.setViewName("../../logregis");
            }
        }else if(identity.equals("employee")){
            Employee employee=employeeLogin(guest);
            if (employee != null) {
                session.setAttribute("employee", employee);
                session.removeAttribute("admin");
                mv.setViewName("employee/employeeinfo");
            } else {
                session.removeAttribute("employee");
                mv.setViewName("../../logregis");
            }
        }else {
            Admin admin=adminLogin(guest);
            if (admin != null) {
                session.setAttribute("admin", admin);
                mv.setViewName("admin/admininfo");
            } else {
                session.removeAttribute("admin");
                mv.setViewName("../../logregis");
            }
        }
        return mv;
    }

    private Employee employeeLogin(Guest guest){
        Employee employee=new Employee();
        employee.setName(guest.getName());
        employee.setPass(guest.getPass());
        employee=es.getByNameAndPass(employee);
        employee.setAttendance(attends.getByEmpidAndStartLike(employee.getId()+"",
                DateUtil.getSqlDateString().substring(0,10)));
        return employee;
    }

    private Admin adminLogin(Guest guest){
        Admin admin=new Admin();
        admin.setName(guest.getName());
        admin.setPass(guest.getPass());
        return as.getByNameAndPass(admin);
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request,HttpSession session, @Valid Guest guest, BindingResult bindingResult){
        ModelAndView mv = new ModelAndView();
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            request.setAttribute("error",fieldError.getDefaultMessage());
            session.removeAttribute("guest");
            mv.setViewName("../../logregis");
        }else {
            if (gs.register(guest)) {
                guest = gs.login(guest);
                session.setAttribute("guest", guest);
                mv.setViewName("guest/guestinfo");
            } else {
                request.setAttribute("error", "用户已存在");
                session.removeAttribute("guest");
                mv.setViewName("../../logregis");
            }
        }
        return mv;
    }

    @RequestMapping("/showrecruitinfo")
    public String showRecruitInfo(HttpServletRequest request, int pageSize, int revoke){
        List<RecruitInfo> recruitInfos=ris.getByPageAndNotRevoke(1,pageSize,revoke);
        request.setAttribute("recruitInfos",recruitInfos);
        int  size=ris.getByNotRevoke(revoke).size();
        int  pageNum=(size%pageSize==0? size/pageSize:size/pageSize+1);
        request.setAttribute("page",1);
        request.getSession().setAttribute("pageNum",pageNum);
        return "forward:/index4.jsp";
    }

    @RequestMapping("/showrecruitinfobypage")
    public ModelAndView showRecruitInfoByPage(int pg,int pageSize,int revoke){
        int start=(pg-1)*pageSize+1;
        int end=pg*pageSize;
        List<RecruitInfo> recruitInfos=ris.getByPageAndNotRevoke(start,end,revoke);
        ModelAndView mv=new ModelAndView();
        mv.addObject("recruitInfos",recruitInfos);
        mv.addObject("page",pg);
        mv.setViewName("../../index4");
        return mv;
    }

    @RequestMapping("/exitlogin")
    public ModelAndView exitLogin(HttpSession session){
        ModelAndView mv = new ModelAndView();
        session.removeAttribute("guest");
        session.removeAttribute("employee");
        session.removeAttribute("admin");
        mv.setViewName("../../index");
        return mv;
    }
}
