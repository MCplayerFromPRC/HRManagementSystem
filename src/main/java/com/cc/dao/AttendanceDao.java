package com.cc.dao;

import com.cc.model.Attendance;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface AttendanceDao {
    Attendance getLastAttendace();
    List<Attendance> getByEmpidAndState(Attendance attendance);
    Attendance getByEmpidAndStartLike(HashMap<String,String> map);
    List<Attendance> getByEmpidAndStartLikeMonth(HashMap<String,String> map);
    List<Attendance> getByEmpidAndStateAndEndTime(Attendance attendance);
    List<Attendance> getByEmpidAndEndTime(Attendance attendance);
    Attendance getById(int id);
    boolean insert(Attendance attendance);
    boolean update(Attendance attendance);
    boolean delete(Attendance attendance);
}
