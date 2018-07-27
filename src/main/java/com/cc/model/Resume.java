package com.cc.model;

import java.io.Serializable;

public class Resume implements Serializable {
    private int id;
    private int gid;
    private String name;
    private String gender;
    private String email;
    private String city;
    private String school;
    private String major;
    private int age;
    private String description;
    private double salary;
    private String job;

    public Resume() {
    }

    public Resume(int id, int gid, String name, String gender, String email, String city, String school, String major, int age, String description, double salary, String job) {
        this.id = id;
        this.gid = gid;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.city = city;
        this.school = school;
        this.major = major;
        this.age = age;
        this.description = description;
        this.salary = salary;
        this.job = job;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "id=" + id +
                ", gid=" + gid +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", city='" + city + '\'' +
                ", school='" + school + '\'' +
                ", major='" + major + '\'' +
                ", age=" + age +
                ", description='" + description + '\'' +
                ", salary=" + salary +
                ", job='" + job + '\'' +
                '}';
    }
}
