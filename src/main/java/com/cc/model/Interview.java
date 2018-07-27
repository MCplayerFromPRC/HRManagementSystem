package com.cc.model;

import java.io.Serializable;

public class Interview implements Serializable {
    private int id;
    private int reid;
    private int riid;
    private int state;
    private String ivtime;

    public Interview() {
    }

    public Interview(int id, int reid, int riid, int state, String ivtime) {
        this.id = id;
        this.reid = reid;
        this.riid = riid;
        this.state = state;
        this.ivtime = ivtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

    public int getRiid() {
        return riid;
    }

    public void setRiid(int riid) {
        this.riid = riid;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getIvtime() {
        return ivtime;
    }

    public void setIvtime(String ivtime) {
        this.ivtime = ivtime;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + id +
                ", reid=" + reid +
                ", riid=" + riid +
                ", state=" + state +
                ", ivtime='" + ivtime + '\'' +
                '}';
    }
}
