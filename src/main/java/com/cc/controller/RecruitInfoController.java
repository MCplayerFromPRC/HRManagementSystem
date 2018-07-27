package com.cc.controller;

import com.cc.model.RecruitInfo;
import com.cc.service.RecruitInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class RecruitInfoController {
    @Resource
    private RecruitInfoService ris;

    @RequestMapping("/showrecruitinfo")
    public @ResponseBody List<RecruitInfo> showRecruitInfo(int revoke){
        return ris.getByRevoke(revoke);
    }
}
