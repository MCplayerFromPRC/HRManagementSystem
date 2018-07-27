package com.cc.service.impl;

import com.cc.dao.ResumeDao;
import com.cc.model.Resume;
import com.cc.service.ResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ResumeServiceImpl implements ResumeService {
    @Resource
    private ResumeDao rd;
    @Override
    public Resume getById(int id) {
        return rd.getById(id);
    }

    @Override
    public List<Resume> getByGid(int gid) {
        return rd.getByGid(gid);
    }

    @Override
    public boolean insert(Resume resume) {
        return rd.insert(resume);
    }

    @Override
    public boolean update(Resume resume) {
        return rd.update(resume);
    }

    @Override
    public boolean delete(Resume resume) {
        return rd.delete(resume);
    }
}
