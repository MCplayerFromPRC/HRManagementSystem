package com.cc.controller;

import com.cc.model.Guest;
import com.cc.model.RecruitInfo;
import com.cc.model.Resume;
import com.cc.service.GuestService;
import com.cc.service.InterviewService;
import com.cc.service.RecruitInfoService;
import com.cc.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/guest")
public class GuestController {
    @Resource
    private GuestService gs;
    @Resource
    private RecruitInfoService ris;
    @Resource
    private ResumeService rs;
    @Resource
    private InterviewService is;

    @RequestMapping("/updateresume")
    public ModelAndView updateResume(HttpSession session,Resume resume){
        rs.update(resume);
        Guest guest= gs.login((Guest) session.getAttribute("guest"));
        session.setAttribute("guest",guest);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("guest/resumelist");
        return mv;
    }

    @RequestMapping("/insertresume")
    public ModelAndView insertResume(HttpSession session,Resume resume){
        rs.insert(resume);
        Guest guest= gs.login((Guest) session.getAttribute("guest"));
        session.setAttribute("guest",guest);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("guest/resumelist");
        return mv;
    }

}
