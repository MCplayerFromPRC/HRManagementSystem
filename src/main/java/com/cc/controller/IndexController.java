package com.cc.controller;

import com.cc.model.Admin;
import com.cc.model.Employee;
import com.cc.model.Guest;
import com.cc.model.RecruitInfo;
import com.cc.service.AdminService;
import com.cc.service.EmployeeService;
import com.cc.service.GuestService;
import com.cc.service.RecruitInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
        return es.getByNameAndPass(employee);
    }

    private Admin adminLogin(Guest guest){
        Admin admin=new Admin();
        admin.setName(guest.getName());
        admin.setPass(guest.getPass());
        return as.getByNameAndPass(admin);
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpSession session,Guest guest){
        ModelAndView mv=new ModelAndView();
        if(gs.register(guest)){
            guest=gs.login(guest);
            session.setAttribute("guest",guest);
            mv.setViewName("guest/guestinfo");
        }else{
            session.removeAttribute("guest");
            mv.setViewName("../../logregis");
        }
        return mv;
    }

    @RequestMapping("/showrecruitinfo")
    public String showRecruitInfo(HttpServletRequest request, int pageSize, int revoke){
        List<RecruitInfo> recruitInfos=ris.getByPage(1,pageSize,revoke);
        request.setAttribute("recruitInfos",recruitInfos);
        int  size=ris.getByRevoke(revoke).size();
        int  pageNum=(size%pageSize==0? size/pageSize:size/pageSize+1);
        request.setAttribute("page",1);
        request.getSession().setAttribute("pageNum",pageNum);
        return "forward:/index4.jsp";
    }

    @RequestMapping("/showrecruitinfobypage")
    public ModelAndView showRecruitInfoByPage(int pg,int pageSize,int revoke){
        int start=(pg-1)*pageSize+1;
        int end=pg*pageSize;
        List<RecruitInfo> recruitInfos=ris.getByPage(start,end,revoke);
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
