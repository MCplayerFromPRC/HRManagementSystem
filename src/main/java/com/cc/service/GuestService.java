package com.cc.service;

import com.cc.model.Guest;

import java.util.List;

public interface GuestService {
    List<Guest> getAll();
    Guest getByName(Guest guest);
    Guest getById(int id);
    Guest login(Guest guest);
    boolean register(Guest guest);
}
