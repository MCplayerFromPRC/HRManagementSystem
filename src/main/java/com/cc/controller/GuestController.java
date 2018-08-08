package com.cc.controller;

import com.cc.model.Guest;
import com.cc.model.Interview;
import com.cc.model.RecruitInfo;
import com.cc.model.Resume;
import com.cc.service.GuestService;
import com.cc.service.InterviewService;
import com.cc.service.RecruitInfoService;
import com.cc.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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
    public ModelAndView updateResume(HttpServletRequest request,HttpSession session, @Valid Resume resume, BindingResult bindingResult){
        ModelAndView mv = new ModelAndView();
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            request.setAttribute("error"+resume.getId(),fieldError.getDefaultMessage());
        }else {
            rs.update(resume);
            Guest guest = gs.login((Guest) session.getAttribute("guest"));
            session.setAttribute("guest", guest);
        }
        mv.setViewName("guest/resumelist");
        return mv;
    }

    @RequestMapping("/insertresume")
    public ModelAndView insertResume(HttpServletRequest request,HttpSession session,@Valid Resume resume, BindingResult bindingResult){
        ModelAndView mv=new ModelAndView();
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            request.setAttribute("error",fieldError.getDefaultMessage());
        }else {
            rs.insert(resume);
            Guest guest = gs.login((Guest) session.getAttribute("guest"));
            session.setAttribute("guest", guest);
        }
        mv.setViewName("guest/resumelist");
        return mv;
    }

    @RequestMapping("/insertinterview")
    public ModelAndView insertInterview(HttpServletRequest request,HttpSession session,@Valid Interview interview,BindingResult bindingResult){
        ModelAndView mv = new ModelAndView();
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            request.setAttribute("error",fieldError.getDefaultMessage());
        }else {
            Guest guest = (Guest) session.getAttribute("guest");
            int reid = 0;
            for (Resume resume : guest.getResumes()) {
                boolean flag = true;
                for (Interview interview1 : resume.getInterviews()) {
                    if (interview1.getRiid() == interview.getRiid()) {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    reid = resume.getId();
                    request.setAttribute("resume", resume);
                }
            }
            if (reid != 0) {
                interview.setReid(reid);
                interview.setState(0);
                is.insert(interview);

            }
            guest = gs.login((Guest) session.getAttribute("guest"));
            session.setAttribute("guest", guest);

        }
        mv.setViewName("guest/resumesent");
        return mv;
    }

    @RequestMapping("/updateinterviewstate")
    public @ResponseBody String updateInterviewState(HttpSession session,int id,int state){
        Interview interview=is.getInterviewById(id);
        interview.setState(state);
        is.update(interview);
        return id+"";
    }
}
