package com.cc.controller;

import com.cc.model.Guest;
import com.cc.model.RecruitInfo;
import com.cc.model.Resume;
import com.cc.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @RequestMapping("/getrecruitinfofirstpage")
    public ModelAndView getRecruitInfoFirstPage(HttpServletRequest request){
        List<RecruitInfo> recruitInfos=ris.getAll();
        ModelAndView mv=new ModelAndView();
        request.getSession().setAttribute("ad_iv_pageNum",recruitInfos.size());
        mv.addObject("recruitInfo",recruitInfos.get(0));
        mv.setViewName("admin/resumelist");
        return mv;
    }

    @RequestMapping("/getrecruitinfobypage")
    public ModelAndView getRecruitInfoByPage(HttpServletRequest request,int pg,int revoke){
        ris.getByPage(pg,pg,revoke);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("guest/resumelist");
        return mv;
    }

}
