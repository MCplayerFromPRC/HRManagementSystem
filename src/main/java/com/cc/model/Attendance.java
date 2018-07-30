package com.cc.model;

import java.io.Serializable;
import java.util.Date;

public class Attendance implements Serializable {
    private int id;
    private Date startTime;
    private Date endTime;
    private int empid;
    private int state;

    public Attendance() {
    }

    public Attendance(int id, Date startTime, Date endTime, int empid, int state) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.empid = empid;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "id=" + id +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", empid=" + empid +
                ", state=" + state +
                '}';
    }
}
