package com.cc.dao;

import com.cc.model.Department;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDao {
    Department getByName(String name);
    Department getById(int id);
    boolean insert(Department department);
    boolean update(Department department);
    boolean delete(Department department);
}
