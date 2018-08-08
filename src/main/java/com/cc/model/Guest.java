package com.cc.model;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

public class Guest implements Serializable {
    private int id;
    @NotNull
    private String name;
    @NotNull
    private String pass;
    private List<Resume> resumes;

    public Guest() {

    }

    public Guest(int id, String name, String pass, List<Resume> resumes) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.resumes = resumes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public List<Resume> getResumes() {
        return resumes;
    }

    public void setResumes(List<Resume> resumes) {
        this.resumes = resumes;
    }

    @Override
    public String toString() {
        return "Guest{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pass='" + pass + '\'' +
                ", resumes=" + resumes +
                '}';
    }
}
