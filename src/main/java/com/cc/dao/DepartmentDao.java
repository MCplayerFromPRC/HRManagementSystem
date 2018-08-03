package com.cc.dao;

import com.cc.model.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DepartmentDao {
    List<Department> getAll();
    List<Department> getByState(int state);
    Department getByPageAndState(@Param("page") int page,@Param("state") int state);
    Department getByName(String name);
    Department getById(int id);
    boolean insert(Department department);
    boolean update(Department department);
    boolean delete(Department department);
}
