package com.cc.dao;

import com.cc.model.Guest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface GuestDao {
    List<Guest> getAll();
    Guest getByNameAndPass(Guest guest);
    Guest getByName(Guest guest);
    Guest getById(int id);
    boolean insert(Guest guest);
}
