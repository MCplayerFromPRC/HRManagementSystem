package com.cc.service.impl;

import com.cc.dao.RecruitInfoDao;
import com.cc.model.RecruitInfo;
import com.cc.service.RecruitInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RecruitInfoServiceImpl implements RecruitInfoService {
    @Resource
    private RecruitInfoDao rid;
    @Override
    public List<RecruitInfo> getByPage(int start, int end, int revoke) {
        Map<String,Integer> map=new HashMap<>();
        map.put("start",start);
        map.put("end",end);
        map.put("revoke",revoke);
        return rid.getByPage(map);
    }

    @Override
    public List<RecruitInfo> getAll() {
        return rid.getAll();
    }

    @Override
    public List<RecruitInfo> getByRevoke(int revoke) {
        return rid.getByRevoke(revoke);
    }

    @Override
    public RecruitInfo getById(int id) {
        return rid.getById(id);
    }

    @Override
    public boolean insert(RecruitInfo recruitInfo) {
        return rid.insert(recruitInfo);
    }

    @Override
    public boolean update(RecruitInfo recruitInfo) {
        return rid.update(recruitInfo);
    }

    @Override
    public boolean delete(RecruitInfo recruitInfo) {
        return rid.delete(recruitInfo);
    }
}
