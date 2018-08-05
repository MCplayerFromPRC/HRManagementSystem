package com.cc.service.impl;

import com.cc.dao.DepartmentDao;
import com.cc.dao.EmployeeDao;
import com.cc.dao.JobDao;
import com.cc.model.Department;
import com.cc.model.Employee;
import com.cc.model.Job;
import com.cc.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeDao ed;
    @Resource
    private DepartmentDao dd;
    @Resource
    private JobDao jd;

    @Override
    public List<Employee> getAll() {
        return ed.getAll();
    }

    @Override
    public List<Employee> getByPage(int start, int end) {
        return ed.getByPage(start,end);
    }

    @Override
    public Employee getByNameAndPass(Employee employee) {
        return ed.getByNameAndPass(employee);
    }

    @Override
    public Employee getById(int id) {
        return ed.getById(id);
    }

    @Override
    public List<Employee> getByJobid(int jobid) {
        return ed.getByJobid(jobid);
    }

    @Override
    public boolean insert(Employee employee) {
        int jobid=employee.getJobid();
        if(jobid!=0&&employee.getState()!=4) {
            Job job=jd.getById(jobid);
            Department department=job.getDepartment();
            department.setEmpno(department.getEmpno()+1);
            dd.update(department);
        }
        return ed.insert(employee);
    }

    @Override
    public boolean update(Employee employee) {
        Employee employee1=ed.getById(employee.getId());
        int jobid1=employee1.getJobid();
        if(jobid1!=0&&employee1.getState()!=4) {
            Job job1=jd.getById(jobid1);
            Department department1=job1.getDepartment();
            department1.setEmpno(department1.getEmpno()-1);
            dd.update(department1);
        }
        int jobid=employee.getJobid();
        if(jobid!=0&&employee.getState()!=4) {
            Job job=jd.getById(jobid);
            Department department=job.getDepartment();
            department.setEmpno(department.getEmpno()+1);
            dd.update(department);
        }
        return ed.update(employee);
    }

    @Override
    public boolean delete(Employee employee) {
        Employee employee1=ed.getById(employee.getId());
        int jobid1=employee1.getJobid();
        if(jobid1!=0&&employee1.getState()!=4) {
            Job job1=jd.getById(jobid1);
            Department department1=job1.getDepartment();
            department1.setEmpno(department1.getEmpno()-1);
            dd.update(department1);
        }
        return ed.delete(employee);
    }
}
