package com.cc.service;

import com.cc.model.Resume;

import java.util.List;

public interface ResumeService {
    Resume getById(int id);
    List<Resume> getByGid(int gid);
    boolean insert(Resume resume);
    boolean update(Resume resume);
    boolean delete(Resume resume);
}
