package com.cc.controller;

import com.cc.model.RecruitInfo;
import com.cc.service.RecruitInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class RecruitInfoController {
    @Resource
    private RecruitInfoService ris;

    @RequestMapping("/showrecruitinfo")
    public String showRecruitInfo(HttpServletRequest request, int pageSize, int revoke){
        List<RecruitInfo> recruitInfos=ris.getByPage(1,pageSize,0);
        request.setAttribute("recruitInfos",recruitInfos);
        int  size=ris.getByRevoke(revoke).size();
        int  pageNum=(size%pageSize==0? size/pageSize:size/pageSize+1);
        request.setAttribute("pageNum",pageNum);
        return "forward:/index4.jsp";
    }

//    @RequestMapping("/showrecruitinfobypage")
//    public @ResponseBody List<RecruitInfo> showRecruitInfoByPage(int revoke){
//        return ris.getByPage(revoke);
//    }
}
