package com.cc.dao;

import com.cc.model.Resume;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResumeDao {
    Resume getById(int id);
    List<Resume> getByGid(int gid);
    boolean insert(Resume resume);
    boolean update(Resume resume);
    boolean delete(Resume resume);
}
