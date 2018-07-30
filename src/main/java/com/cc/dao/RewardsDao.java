package com.cc.dao;

import com.cc.model.Rewards;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RewardsDao {
    List<Rewards> getByEmpidAndPayDate(Rewards rewards);
    Rewards getById(int id);
    boolean insert(Rewards rewards);
    boolean update(Rewards rewards);
    boolean delete(Rewards rewards);
}
