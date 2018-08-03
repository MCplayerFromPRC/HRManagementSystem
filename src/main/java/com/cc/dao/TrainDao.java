package com.cc.dao;

import com.cc.model.Train;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainDao {
    Train getByContent(String content);
    Train getById(int id);
    boolean insert(Train train);
    boolean update(Train train);
    boolean delete(Train train);
}
