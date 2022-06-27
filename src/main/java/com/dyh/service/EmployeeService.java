package com.dyh.service;


import com.dyh.dao.EmployeeDao;
import com.dyh.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author daiyuhua
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
public class EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;

    public Boolean editEmployee(Employee employee){
        return employeeDao.editEmployee(employee);
    }
    public Boolean addEmployee(Employee employee){
        return employeeDao.addEmployee(employee);
    }
    public Boolean deleteEmployee(String workId){
        return employeeDao.deleteEmployee(workId);
    }

    public Employee findEmployeeByWorkId(String workId){
        return employeeDao.findEmployeeByWorkId(workId);
    }

    public Boolean editEmployeeStatus(String workId){
        return employeeDao.editEmployeeStatus(workId);
    }

    public Boolean editEmployeeMoney(Employee employee){
        return employeeDao.editEmployeeMoney(employee);
    }
}
