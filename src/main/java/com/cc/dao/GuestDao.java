package com.cc.dao;

import com.cc.model.Guest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
public interface GuestDao {
    Guest getByNameAndPass(Guest guest);
    Guest getByName(Guest guest);
    boolean insert(Guest guest);
}
