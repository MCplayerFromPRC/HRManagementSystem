package com.cc.model;

import java.io.Serializable;
import java.util.Date;

public class Rewards implements Serializable {
    private int id;
    private int empid;
    private Date payDate;
    private double reMoney;
    private Date time;

    public Rewards() {
    }

    public Rewards(int id, int empid, Date payDate, double reMoney,Date time) {
        this.id = id;
        this.empid = empid;
        this.payDate = payDate;
        this.reMoney = reMoney;
        this.time=time;
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

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public double getReMoney() {
        return reMoney;
    }

    public void setReMoney(double reMoney) {
        this.reMoney = reMoney;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Rewards{" +
                "id=" + id +
                ", empid=" + empid +
                ", payDate='" + payDate + '\'' +
                ", reMoney=" + reMoney +
                ", time=" + time +
                '}';
    }
}
