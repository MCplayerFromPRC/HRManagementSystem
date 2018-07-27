package com.cc.service.impl;

import com.cc.dao.AdminDao;
import com.cc.model.Admin;
import com.cc.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao ad;
    @Override
    public Admin getByNameAndPass(Admin admin) {
        return ad.getByNameAndPass(admin);
    }
}
