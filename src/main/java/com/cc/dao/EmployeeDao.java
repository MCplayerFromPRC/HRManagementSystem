package com.cc.dao;

import com.cc.model.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EmployeeDao {
    List<Employee> getAll();
    List<Employee> getByPage(@Param("start") int start, @Param("end") int end);
    Employee getByNameAndPass(Employee employee);
    Employee getById(int id);
    List<Employee> getByJobid(int jobid);
    List<Employee> getByTrainid(int trainid);
    boolean insert(Employee employee);
    boolean update(Employee employee);
    boolean delete(Employee employee);
}
