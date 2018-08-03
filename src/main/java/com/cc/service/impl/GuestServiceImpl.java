package com.cc.service.impl;

import com.cc.dao.GuestDao;
import com.cc.model.Guest;
import com.cc.service.GuestService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class GuestServiceImpl implements GuestService {
    @Resource
    private GuestDao gd;

    @Override
    public List<Guest> getAll() {
        return gd.getAll();
    }

    @Override
    public Guest getByName(Guest guest) {
        return gd.getByName(guest);
    }

    @Override
    public Guest getById(int id) {
        return gd.getById(id);
    }

    @Override
    public Guest login(Guest guest) {
        return gd.getByNameAndPass(guest);
    }

    @Override
    public boolean register(Guest guest) {
        if(gd.getByName(guest)==null){
            return gd.insert(guest);
        }
        return false;
    }
}
