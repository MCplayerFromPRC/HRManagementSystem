package com.cc.service.impl;

import com.cc.dao.TrainDao;
import com.cc.model.Train;
import com.cc.service.TrainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TrainServiceImpl implements TrainService {
    @Resource
    private TrainDao td;

    @Override
    public List<Train> getByNotState(List<Integer> states) {
        return td.getByNotState(states);
    }

    @Override
    public List<Train> getAll() {
        return td.getAll();
    }

    @Override
    public Train getByContent(String content) {
        return td.getByContent(content);
    }

    @Override
    public Train getById(int id) {
        return td.getById(id);
    }

    @Override
    public boolean insert(Train train) {
        return td.insert(train);
    }

    @Override
    public boolean update(Train train) {
        return td.update(train);
    }

    @Override
    public boolean delete(Train train) {
        return td.delete(train);
    }
}
