package com.cc.service;

import com.cc.model.RecruitInfo;

import java.util.List;
import java.util.Map;

public interface RecruitInfoService {
    List<RecruitInfo> getByPage(int start,int end,int revoke);
    List<RecruitInfo> getAll();
    List<RecruitInfo> getByRevoke(int revoke);
    RecruitInfo getById(int id);
    boolean insert(RecruitInfo recruitInfo);
    boolean update(RecruitInfo recruitInfo);
    boolean delete(RecruitInfo recruitInfo);
}
