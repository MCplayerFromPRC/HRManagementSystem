package com.cc.model;

import java.io.Serializable;

public class Job implements Serializable {
    private int id;
    private String name;
    private int did;

    public Job() {
    }

    public Job(int id, String name, int did) {
        this.id = id;
        this.name = name;
        this.did = did;
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

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", did=" + did +
                '}';
    }
}
