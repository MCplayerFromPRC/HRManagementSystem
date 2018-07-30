package com.cc.service.impl;

import com.cc.dao.RewardsDao;
import com.cc.model.Rewards;
import com.cc.service.RewardsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RewardsServiceImpl implements RewardsService {
    @Resource
    private RewardsDao rd;
    @Override
    public List<Rewards> getByEmpidAndPayDate(Rewards rewards) {
        return rd.getByEmpidAndPayDate(rewards);
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
