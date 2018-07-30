package com.cc.service;

import com.cc.model.Rewards;

import java.util.List;

public interface RewardsService {
    List<Rewards> getByEmpidAndPayDate(Rewards rewards);
    Rewards getById(int id);
    boolean insert(Rewards rewards);
    boolean update(Rewards rewards);
    boolean delete(Rewards rewards);
}
