package com.cc.dao;

import com.cc.model.RecruitInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RecruitInfoDao {
    List<RecruitInfo> getByPage(Map<String,Integer> pageInfo);
    List<RecruitInfo> getAll();
    List<RecruitInfo> getByRevoke(int revoke);
    RecruitInfo getById(int id);
    boolean insert(RecruitInfo recruitInfo);
    boolean update(RecruitInfo recruitInfo);
    boolean delete(RecruitInfo recruitInfo);
}
