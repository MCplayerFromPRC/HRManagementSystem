package com.cc.model;

import java.io.Serializable;
import java.util.List;

public class Job implements Serializable {
    private int id;
    private String name;
    private int did;
    private int state;
    private Department department;
    private List<Employee> employees;

    public Job() {
    }

    public Job(int id, String name, int did, int state, Department department, List<Employee> employees) {
        this.id = id;
        this.name = name;
        this.did = did;
        this.state = state;
        this.department = department;
        this.employees = employees;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", did=" + did +
                ", state=" + state +
                '}';
    }
}
