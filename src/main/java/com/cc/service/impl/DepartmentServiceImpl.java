package com.cc.service.impl;

import com.cc.dao.DepartmentDao;
import com.cc.dao.JobDao;
import com.cc.model.Department;
import com.cc.model.Job;
import com.cc.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao dd;
    @Resource
    private JobDao jd;
    @Override
    public List<Department> getAll() {
        return dd.getAll();
    }

    @Override
    public List<Department> getByState(int state) {
        return dd.getByState(state);
    }

    @Override
    public Department getByPageAndState(int page, int state) {
        return dd.getByPageAndState(page,state);
    }

    @Override
    public Department getByName(String name) {
        return dd.getByName(name);
    }

    @Override
    public Department getById(int id) {
        return dd.getById(id);
    }

    @Override
    public boolean insert(Department department) {
        Department department1=dd.getByName(department.getName());
        if(department1==null) {
            return dd.insert(department);
        }else {
            return false;
        }
    }

    @Override
    public boolean update(Department department) {
        return dd.update(department);
    }

    @Override
    public boolean delete(Department department) {
        if(department.getEmpno()==0) {
            List<Job> jobs=dd.getById(department.getId()).getJobs();
            for(Job job:jobs) {
                jd.delete(job);
            }
            return dd.delete(department);
        }else {
            return false;
        }
    }
}
