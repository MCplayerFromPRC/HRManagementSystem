package com.cc.model;

import java.io.Serializable;
import java.util.Date;

public class Salary implements Serializable {
    private int id;
    private int empid;
    private double salMoney;
    private double bonus;
    private double over;
    private double rewards;
    private double socialSecurity;
    private double aggregate;
    private Date payDate;

    public Salary() {
    }

    public Salary(int id, int empid, double salMoney, double bonus, double over, double rewards, double socialSecurity, double aggregate, Date payDate) {
        this.id = id;
        this.empid = empid;
        this.salMoney = salMoney;
        this.bonus = bonus;
        this.over = over;
        this.rewards = rewards;
        this.socialSecurity = socialSecurity;
        this.aggregate = aggregate;
        this.payDate = payDate;
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

    public double getSalMoney() {
        return salMoney;
    }

    public void setSalMoney(double salMoney) {
        this.salMoney = salMoney;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getOver() {
        return over;
    }

    public void setOver(double over) {
        this.over = over;
    }

    public double getRewards() {
        return rewards;
    }

    public void setRewards(double rewards) {
        this.rewards = rewards;
    }

    public double getSocialSecurity() {
        return socialSecurity;
    }

    public void setSocialSecurity(double socialSecurity) {
        this.socialSecurity = socialSecurity;
    }

    public double getAggregate() {
        return aggregate;
    }

    public void setAggregate(double aggregate) {
        this.aggregate = aggregate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", empid=" + empid +
                ", salMoney=" + salMoney +
                ", bonus=" + bonus +
                ", over=" + over +
                ", rewards=" + rewards +
                ", socialSecurity=" + socialSecurity +
                ", aggregate=" + aggregate +
                ", payDate='" + payDate + '\'' +
                '}';
    }
}
