package com.cc.service.impl;

import com.cc.dao.RewardsDao;
import com.cc.model.Rewards;
import com.cc.service.RewardsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class RewardsServiceImpl implements RewardsService {
    @Resource
    private RewardsDao rd;

    @Override
    public List<Rewards> getByEmpid(int empid) {
        return rd.getByEmpid(empid);
    }

    @Override
    public List<Rewards> getByEmpidAndState(Rewards rewards) {
        return rd.getByEmpidAndState(rewards);
    }

    @Override
    public List<Rewards> getByEmpidAndNotState(Rewards rewards) {
        return rd.getByEmpidAndNotState(rewards);
    }

    @Override
    public List<Rewards> getByEmpidAndPage(int empid,int  start,int end) {
        HashMap<String,Integer> map=new HashMap<>();
        map.put("empid",empid);
        map.put("start",start);
        map.put("end",end);
        return rd.getByEmpidAndPage(map);
    }

    @Override
    public Rewards getById(int id) {
        return rd.getById(id);
    }

    @Override
    public boolean insert(Rewards rewards) {
        return rd.insert(rewards);
    }

    @Override
    public boolean update(Rewards rewards) {
        return rd.update(rewards);
    }

    @Override
    public boolean delete(Rewards rewards) {
        return rd.delete(rewards);
    }
}
