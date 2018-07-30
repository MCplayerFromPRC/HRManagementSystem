package com.cc.dao;

import com.cc.model.RecruitInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface RecruitInfoDao {
//    List<RecruitInfo> getByPage(@Param("start") int start,@Param("end") int end,@Param("revoke") int revoke);
    List<RecruitInfo> getByPage(HashMap<String,Integer> map);
    List<RecruitInfo> getAll();
    List<RecruitInfo> getByRevoke(int revoke);
    RecruitInfo getById(int id);
    boolean insert(RecruitInfo recruitInfo);
    boolean update(RecruitInfo recruitInfo);
    boolean delete(RecruitInfo recruitInfo);
}
