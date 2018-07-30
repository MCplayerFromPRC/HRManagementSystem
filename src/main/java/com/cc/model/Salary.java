package com.cc.model;

public class Salary {
    private int id;
    private int empid;
    private double salary;
    private double bonus;
    private double over;
    private double rewards;
    private double socialSecurity;
    private double aggregate;
    private String payDate;

    public Salary() {
    }

    public Salary(int id, int empid, double salary, double bonus, double over, double rewards, double socialSecurity, double aggregate, String payDate) {
        this.id = id;
        this.empid = empid;
        this.salary = salary;
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

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
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

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", empid=" + empid +
                ", salary=" + salary +
                ", bonus=" + bonus +
                ", over=" + over +
                ", rewards=" + rewards +
                ", socialSecurity=" + socialSecurity +
                ", aggregate=" + aggregate +
                ", payDate='" + payDate + '\'' +
                '}';
    }
}
