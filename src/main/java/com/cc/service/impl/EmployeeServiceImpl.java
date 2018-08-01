package com.cc.service.impl;

import com.cc.dao.EmployeeDao;
import com.cc.model.Employee;
import com.cc.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeDao ed;

    @Override
    public Employee getByNameAndPass(Employee employee) {
        return ed.getByNameAndPass(employee);
    }

    @Override
    public Employee getById(int id) {
        return ed.getById(id);
    }

    @Override
    public List<Employee> getByJobid(int jobid) {
        return ed.getByJobid(jobid);
    }

    @Override
    public boolean insert(Employee employee) {
        return ed.insert(employee);
    }

    @Override
    public boolean update(Employee employee) {
        return ed.update(employee);
    }

    @Override
    public boolean delete(Employee employee) {
        return ed.delete(employee);
    }
}
