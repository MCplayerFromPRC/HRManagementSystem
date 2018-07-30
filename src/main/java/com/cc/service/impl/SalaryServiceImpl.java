package com.cc.service.impl;

import com.cc.dao.SalaryDao;
import com.cc.model.Salary;
import com.cc.service.SalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {
    @Resource
    private SalaryDao sd;
    @Override
    public Salary getByEmpidAndPayDate(Salary salary) {
        return sd.getByEmpidAndPayDate(salary);
    }

    @Override
    public List<Salary> getByEmpid(int empid) {
        return sd.getByEmpid(empid);
    }

    @Override
    public List<Salary> getByPayDate(String payDate) {
        return sd.getByPayDate(payDate);
    }

    @Override
    public boolean insert(Salary salary) {
        return sd.insert(salary);
    }

    @Override
    public boolean update(Salary salary) {
        return sd.update(salary);
    }

    @Override
    public boolean delete(Salary salary) {
        return sd.delete(salary);
    }
}
