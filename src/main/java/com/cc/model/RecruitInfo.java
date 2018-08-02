package com.cc.model;

import java.io.Serializable;
import java.util.List;

public class RecruitInfo implements Serializable {
    private int id;
    private String company;
    private String address;
    private long phone;
    private double salary;
    private String industry;
    private int revoke;
    private String job;
    private List<Interview> interviews;

    public RecruitInfo() {
    }

    public RecruitInfo(int id, String company, String address, long phone, double salary, String industry, int revoke, String job, List<Interview> interviews) {
        this.id = id;
        this.company = company;
        this.address = address;
        this.phone = phone;
        this.salary = salary;
        this.industry = industry;
        this.revoke = revoke;
        this.job = job;
        this.interviews = interviews;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public int getRevoke() {
        return revoke;
    }

    public void setRevoke(int revoke) {
        this.revoke = revoke;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public List<Interview> getInterviews() {
        return interviews;
    }

    public void setInterviews(List<Interview> interviews) {
        this.interviews = interviews;
    }

    @Override
    public String toString() {
        return "RecruitInfo{" +
                "id=" + id +
                ", company='" + company + '\'' +
                ", address='" + address + '\'' +
                ", phone=" + phone +
                ", salary=" + salary +
                ", industry='" + industry + '\'' +
                ", revoke=" + revoke +
                ", job='" + job + '\'' +
                '}';
    }
}
