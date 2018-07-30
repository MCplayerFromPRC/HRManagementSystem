package com.cc.service;

import com.cc.model.Job;

import java.util.List;

public interface JobService {
    Job getByName(String name);
    List<Job> getByDid(int did);
    boolean insert(Job job);
    boolean update(Job job);
    boolean delete(Job job);
}
