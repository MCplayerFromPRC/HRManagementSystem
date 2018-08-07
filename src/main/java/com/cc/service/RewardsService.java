package com.cc.service;

import com.cc.model.Rewards;

import java.util.HashMap;
import java.util.List;

public interface RewardsService {
    List<Rewards> getByEmpid(int empid);
    List<Rewards> getByEmpidAndState(Rewards rewards);
    List<Rewards> getByEmpidAndNotState(Rewards rewards);
    List<Rewards> getByEmpidAndPage(int empid,int  start,int end);
    Rewards getById(int id);
    boolean insert(Rewards rewards);
    boolean update(Rewards rewards);
    boolean delete(Rewards rewards);
}
