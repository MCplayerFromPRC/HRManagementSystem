package com.cc.dao;

import com.cc.model.Interview;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InterviewDao {
    List<Interview> getInterviewByState(int state);
    List<Interview> getInterviewByReidAndState(Interview interview);
    List<Interview> getInterviewByRiidAndState(Interview interview);
    Interview getInterviewById(int id);
    boolean insert(Interview interview);
    boolean update(Interview interview);
    boolean delete(Interview interview);
}
