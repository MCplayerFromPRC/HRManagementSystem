package com.cc.service.impl;

import com.cc.dao.DepartmentDao;
import com.cc.model.Department;
import com.cc.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao dd;
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
        return dd.insert(department);
    }

    @Override
    public boolean update(Department department) {
        return dd.update(department);
    }

    @Override
    public boolean delete(Department department) {
        return dd.delete(department);
    }
}
