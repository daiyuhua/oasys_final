package com.dyh.controller;

import com.dyh.entity.Check;
import com.dyh.service.CheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author daiyuhua
 */
@RestController
@RequestMapping("/oasys-back-end")
public class CheckController {
    @Autowired
    private CheckService checkService;

    @PostMapping("addCheck")
    public Boolean addCheck(@RequestBody Check check){
        Boolean flag = false;
        System.out.println(check.toString());
        flag = checkService.addCheck(check);
        return flag;
    }
}
