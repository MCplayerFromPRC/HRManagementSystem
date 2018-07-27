package com.cc.dao;

import com.cc.model.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {
    Admin getByNameAndPass(Admin admin);
}
