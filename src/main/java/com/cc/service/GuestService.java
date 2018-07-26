package com.cc.service;

import com.cc.model.Guest;

public interface GuestService {
    Guest login(Guest guest);
    boolean register(Guest guest);
}
