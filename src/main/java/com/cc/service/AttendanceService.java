package com.cc.service;

import com.cc.model.Attendance;

import java.util.HashMap;
import java.util.List;

public interface AttendanceService {
    List<Attendance> getByEmpidAndState(Attendance attendance);
    Attendance getByEmpidAndStartLike(String empid,String startlike);
    List<Attendance> getByEmpidAndStateAndEndTime(Attendance attendance);
    List<Attendance> getByEmpidAndEndTime(Attendance attendance);
    Attendance getById(int id);
    boolean insert(Attendance attendance);
    boolean update(Attendance attendance);
    boolean delete(Attendance attendance);
}
