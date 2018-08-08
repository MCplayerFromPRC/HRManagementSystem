package com.cc.dao;

import com.cc.model.Salary;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SalaryDao {
    Salary getByEmpidAndAddDate(Salary salary);
    Salary getByEmpidAndPayDate(Salary salary);
    List<Salary> getByEmpid(int empid);
    List<Salary> getByPayDate(String payDate);
    boolean insert(Salary salary);
    boolean update(Salary salary);
    boolean delete(Salary salary);
}
