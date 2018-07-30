package com.cc.service.impl;

import com.cc.dao.JobDao;
import com.cc.model.Job;
import com.cc.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class JobServiceImpl implements JobService {
    @Resource
    private JobDao jd;
    @Override
    public Job getByName(String name) {
        return jd.getByName(name);
    }

    @Override
    public List<Job> getByDid(int did) {
        return jd.getByDid(did);
    }

    @Override
    public boolean insert(Job job) {
        return jd.insert(job);
    }

    @Override
    public boolean update(Job job) {
        return jd.update(job);
    }

    @Override
    public boolean delete(Job job) {
        return jd.delete(job);
    }
}
