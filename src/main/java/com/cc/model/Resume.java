package com.cc.model;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

public class Resume implements Serializable {
    private int id;
    private int gid;
    @NotNull
    private String name;
    @NotNull
    private String gender;
    @NotNull
    private String email;
    @NotNull
    private String city;
    @NotNull
    private String school;
    @NotNull
    private String major;
    @Min(0)
    private int age;
    private String description;
    @Min(0)
    private double salary;
    @NotNull
    private String job;
    private Guest guest;
    private List<Interview> interviews;

    public Resume() {
    }

    public Resume(int id, int gid, String name, String gender, String email, String city, String school, String major, int age, String description, double salary, String job, Guest guest, List<Interview> interviews) {
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
        this.guest = guest;
        this.interviews = interviews;
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

    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guest) {
        this.guest = guest;
    }

    public List<Interview> getInterviews() {
        return interviews;
    }

    public void setInterviews(List<Interview> interviews) {
        this.interviews = interviews;
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
