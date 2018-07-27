package com.cc.dao;

import com.cc.model.Employee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeDao {
    Employee getById(int id);
    List<Employee> getByJobid(int jobid);
    boolean insert(Employee employee);
    boolean update(Employee employee);
    boolean delete(Employee employee);
}
