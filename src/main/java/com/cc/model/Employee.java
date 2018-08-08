package com.cc.model;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

public class Employee implements Serializable {
    private int id;
    private String account;
    private String pass;
    private String name;
    private String gender;
    private int age;
    private int jobid;
    private double salary;
    private double socialSecurity;
    private int trainid;
    private long phone;
    private String email;
    private int state;
    private int gid;
    private Guest guest;
    private Job job;
    private Train train;
    private List<Rewards> rewardss;
    private Attendance attendance;

    public Employee() {
    }

    public Employee(int id, String account, String pass, String name, String gender, int age, int jobid, double salary, double socialSecurity, int trainid, long phone, String email, int state, int gid, Guest guest, Job job, Train train, List<Rewards> rewardss, Attendance attendance) {
        this.id = id;
        this.account = account;
        this.pass = pass;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.jobid = jobid;
        this.salary = salary;
        this.socialSecurity = socialSecurity;
        this.trainid = trainid;
        this.phone = phone;
        this.email = email;
        this.state = state;
        this.gid = gid;
        this.guest = guest;
        this.job = job;
        this.train = train;
        this.rewardss = rewardss;
        this.attendance = attendance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public double getSocialSecurity() {
        return socialSecurity;
    }

    public void setSocialSecurity(double socialSecurity) {
        this.socialSecurity = socialSecurity;
    }

    public int getTrainid() {
        return trainid;
    }

    public void setTrainid(int trainid) {
        this.trainid = trainid;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guest) {
        this.guest = guest;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    public List<Rewards> getRewardss() {
        return rewardss;
    }

    public void setRewardss(List<Rewards> rewardss) {
        this.rewardss = rewardss;
    }

    public Attendance getAttendance() {
        return attendance;
    }

    public void setAttendance(Attendance attendance) {
        this.attendance = attendance;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pass='" + pass + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", jobid=" + jobid +
                ", salary=" + salary +
                ", socialSecurity=" + socialSecurity +
                ", trainid=" + trainid +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", state=" + state +
                ", gid=" + gid +
                ", attendance=" + attendance +
                '}';
    }
}
