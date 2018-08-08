package com.cc.service.impl;

import com.cc.dao.AttendanceDao;
import com.cc.model.Attendance;
import com.cc.service.AttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService {
    @Resource
    private AttendanceDao ad;

    @Override
    public List<Attendance> getByEmpidAndState(Attendance attendance) {
        return ad.getByEmpidAndState(attendance);
    }

    @Override
    public Attendance getByEmpidAndStartLike(String empid, String startlike) {
        HashMap<String,String> map=new HashMap<>();
        map.put("startlike",startlike);
        map.put("empid",empid);
        return ad.getByEmpidAndStartLike(map);
    }

    @Override
    public List<Attendance> getByEmpidAndStateAndEndTime(Attendance attendance) {
        return ad.getByEmpidAndStateAndEndTime(attendance);
    }

    @Override
    public List<Attendance> getByEmpidAndEndTime(Attendance attendance) {
        return ad.getByEmpidAndEndTime(attendance);
    }

    @Override
    public Attendance getById(int id) {
        return ad.getById(id);
    }

    @Override
    public boolean insert(Attendance attendance) {
        return ad.insert(attendance);
    }

    @Override
    public boolean update(Attendance attendance) {
        return ad.update(attendance);
    }

    @Override
    public boolean delete(Attendance attendance) {
        return ad.delete(attendance);
    }
}
