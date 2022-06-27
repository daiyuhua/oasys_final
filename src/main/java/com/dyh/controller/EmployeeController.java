package com.dyh.controller;

import com.dyh.entity.Employee;
import com.dyh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/findEmployee")
    public Employee findEmployeeByWorkId(String workId){
        return employeeService.findEmployeeByWorkId(workId);
    }
}
