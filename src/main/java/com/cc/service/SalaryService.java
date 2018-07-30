package com.cc.service;

import com.cc.model.Salary;

import java.util.List;

public interface SalaryService {
    Salary getByEmpidAndPayDate(Salary salary);
    List<Salary> getByEmpid(int empid);
    List<Salary> getByPayDate(String payDate);
    boolean insert(Salary salary);
    boolean update(Salary salary);
    boolean delete(Salary salary);
}
