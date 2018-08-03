package com.cc.dao;

import com.cc.model.Job;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface JobDao {
    Job getByName(String name);
    Job getById(int id);
    List<Job> getByDid(int did);
    boolean insert(Job job);
    boolean update(Job job);
    boolean delete(Job job);
}
