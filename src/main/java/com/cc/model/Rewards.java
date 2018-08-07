package com.cc.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Rewards implements Serializable {
    private int id;
    private int empid;
    private int state;
    private double reMoney;
    private Timestamp time;
    private String description;

    public Rewards() {
    }

    public Rewards(int id, int empid, int state, double reMoney, Timestamp time, String description) {
        this.id = id;
        this.empid = empid;
        this.state = state;
        this.reMoney = reMoney;
        this.time = time;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public double getReMoney() {
        return reMoney;
    }

    public void setReMoney(double reMoney) {
        this.reMoney = reMoney;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Rewards{" +
                "id=" + id +
                ", empid=" + empid +
                ", state=" + state +
                ", reMoney=" + reMoney +
                ", time=" + time +
                ", description='" + description + '\'' +
                '}';
    }
}
