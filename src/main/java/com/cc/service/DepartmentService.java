package com.cc.service;

import com.cc.model.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentService {
    List<Department> getAll();
    List<Department> getByState(int state);
    Department getByPageAndState(int page,int state);
    Department getByName(String name);
    Department getById(int id);
    boolean insert(Department department);
    boolean update(Department department);
    boolean delete(Department department);
}
