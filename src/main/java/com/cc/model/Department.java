package com.cc.model;

import java.io.Serializable;

public class Department implements Serializable {
    private int id;
    private String name;
    private int empno;

    public Department() {
    }

    public Department(int id, String name, int empno) {
        this.id = id;
        this.name = name;
        this.empno = empno;
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

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", empno=" + empno +
                '}';
    }
}
