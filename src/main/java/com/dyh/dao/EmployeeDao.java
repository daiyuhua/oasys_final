package com.dyh.dao;

import com.dyh.entity.Employee;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author daiyuhua
 */

@Mapper
public interface EmployeeDao {
    public Boolean editEmployee(Employee employee);

    public Boolean addEmployee(Employee employee);

    public Boolean deleteEmployee(String workId);

    public Employee findEmployeeByWorkId(String workId);

    public Boolean editEmployeeStatus(String workId);

    public Boolean editEmployeeMoney(Employee employee);

    List<Employee> findAllEmployee(Integer page, Integer size, @Param("keyword")String keyword, String fatherRole);

    Integer getTotalEmployee();
}
