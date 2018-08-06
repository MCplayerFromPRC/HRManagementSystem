package com.cc.service;

import com.cc.model.Train;

import java.util.List;

public interface TrainService {
    List<Train> getByNotState(List<Integer> states);
    List<Train> getAll();
    Train getByContent(String content);
    Train getById(int id);
    boolean insert(Train train);
    boolean update(Train train);
    boolean delete(Train train);
}
