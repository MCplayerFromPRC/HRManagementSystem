package com.cc.service;

import com.cc.model.Department;

public interface DepartmentService {
    Department getByName(String name);
    Department getById(int id);
    boolean insert(Department department);
    boolean update(Department department);
    boolean delete(Department department);
}
