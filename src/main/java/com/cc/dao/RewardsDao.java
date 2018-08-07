package com.cc.dao;

import com.cc.model.Rewards;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RewardsDao {
    List<Rewards> getByEmpid(int empid);
    List<Rewards> getByEmpidAndState(Rewards rewards);
    List<Rewards> getByEmpidAndNotState(Rewards rewards);
    List<Rewards> getByEmpidAndPage(HashMap<String,Integer> map);
    Rewards getById(int id);
    boolean insert(Rewards rewards);
    boolean update(Rewards rewards);
    boolean delete(Rewards rewards);
}
