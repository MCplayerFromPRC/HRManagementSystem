package com.cc.controller;

import com.cc.model.Guest;
import com.cc.service.GuestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class GuestController {
    @Resource
    private GuestService gs;

    @RequestMapping("/home")
    public String home(){
        return "../../index";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpSession session,Guest guest){
        guest=gs.login(guest);
        ModelAndView mv=new ModelAndView();
        if(guest!=null){
            session.setAttribute("guest",guest);
            mv.setViewName("guestinfo");
        }else {
            session.removeAttribute("guest");
            mv.setViewName("../../logregis");
        }
        return mv;
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpSession session,Guest guest){
        ModelAndView mv=new ModelAndView();
        if(gs.register(guest)){
            guest=gs.login(guest);
            session.setAttribute("guest",guest);
            mv.setViewName("guestinfo");
        }else{
            session.removeAttribute("guest");
            mv.setViewName("../../logregis");
        }
        return mv;
    }

}
