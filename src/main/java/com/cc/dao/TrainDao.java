package com.cc.dao;

import com.cc.model.Train;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TrainDao {
    List<Train> getByNotState(List<Integer> states);
    List<Train> getAll();
    Train getByContent(String content);
    Train getById(int id);
    boolean insert(Train train);
    boolean update(Train train);
    boolean delete(Train train);
}
