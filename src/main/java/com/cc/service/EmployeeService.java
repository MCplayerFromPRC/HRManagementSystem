package com.cc.service;

import com.cc.model.Employee;

import java.util.List;

public interface EmployeeService {
    Employee getByNameAndPass(Employee employee);
    Employee getById(int id);
    List<Employee> getByJobid(int jobid);
    boolean insert(Employee employee);
    boolean update(Employee employee);
    boolean delete(Employee employee);
}
