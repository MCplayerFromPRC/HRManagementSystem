package com.cc.service.impl;

import com.cc.dao.AttendanceDao;
import com.cc.dao.RewardsDao;
import com.cc.dao.SalaryDao;
import com.cc.model.Attendance;
import com.cc.model.Rewards;
import com.cc.model.Salary;
import com.cc.service.RewardsService;
import com.cc.service.SalaryService;
import com.cc.util.DateUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {
    @Resource
    private SalaryDao sd;
    @Resource
    private RewardsDao rd;
    @Resource
    private AttendanceDao ad;

    @Override
    public Salary getByEmpidAndAddDate(Salary salary) {
        return sd.getByEmpidAndAddDate(salary);
    }

    @Override
    public Salary getByEmpidAndPayDate(Salary salary) {
        return sd.getByEmpidAndPayDate(salary);
    }

    @Override
    public List<Salary> getByEmpid(int empid) {
        return sd.getByEmpid(empid);
    }

    @Override
    public List<Salary> getByPayDate(String payDate) {
        return sd.getByPayDate(payDate);
    }

    @Override
    public boolean insert(Salary salary) {
        Rewards rewards=new Rewards();
        rewards.setEmpid(salary.getEmpid());
        rewards.setState(0);
        List<Rewards> rewardsList=rd.getByEmpidAndState(rewards);
        double salRewards=0;
        for(Rewards rewards1:rewardsList){
            salRewards+=rewards1.getReMoney();
            rewards1.setState(1);
            rd.update(rewards1);
        }
        salary.setRewards(salRewards);
        rewards.setState(1);
        List<Rewards> rewardsList2=rd.getByEmpidAndState(rewards);
        for(Rewards rewards1:rewardsList2){
            rewards1.setState(3);
            rd.update(rewards1);
        }

        HashMap<String,String> map=new HashMap<>();
        map.put("empid",salary.getEmpid()+"");
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -1);
        Date lastMonth=calendar.getTime();
        map.put("startlike",DateUtil.transTimeStamp(lastMonth).substring(0,7));
        List<Attendance> attendances=ad.getByEmpidAndStartLikeMonth(map);
        salary.setOver((attendances.size()-22)*100);
        salary.setAggregate(salary.getSalMoney()+salary.getBonus()+salary.getOver()+salRewards-salary.getSocialSecurity());
        return sd.insert(salary);
    }

    @Override
    public boolean update(Salary salary) {
        return sd.update(salary);
    }

    @Override
    public boolean delete(Salary salary) {
        return sd.delete(salary);
    }
}
