package com.dyh.controller;


import com.dyh.Bean.RespPageBean;
import com.dyh.Util.PoiUtil;
import com.dyh.entity.Employee;
import com.dyh.entity.User;
import com.dyh.service.EmployeeService;
import com.dyh.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/getUser")
    @ResponseBody
    public RespPageBean findAllUser(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String keyword,String fatherRole){
        return userService.findAllUser(page,size,keyword,fatherRole);
    }

    @PostMapping("/editUser")
    @ResponseBody
    public Boolean editUser(@RequestBody User form){
        System.out.println(form.toString());
        System.out.println("修改触发");
        Boolean flag = false;
        flag = userService.editUser(form);
        if (flag == true){
            flag = employeeService.editEmployee(form.getEmployee());
        }
        return flag;
    }

    @PostMapping("/addUser")
    @ResponseBody
    public Boolean addUser(@RequestBody User form){
        System.out.println(form.getEmployee());
        Boolean flag = false;
        flag = employeeService.addEmployee(form.getEmployee());
        if (flag == true){
            flag = userService.addUser(form);
            if (flag == true){
                flag = userService.addUserRole(form);
            }
        }
        return flag;
    }

    @DeleteMapping("/deleteUser")
    @ResponseBody
    public Boolean deleteUser(@RequestBody Employee employee){
        Boolean flag = false;
        flag = employeeService.deleteEmployee(employee.getWorkId());
        return flag;
    }

    @GetMapping("/export")
    public ResponseEntity<byte[]> exportEmp(@RequestParam String keyword,@RequestParam String fatherRole){
        return PoiUtil.exportEmpToExcel(userService.findAllUser(keyword, fatherRole));
    }
}
