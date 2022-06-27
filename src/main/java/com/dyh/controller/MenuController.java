package com.dyh.controller;


import com.dyh.Bean.RespBean;
import com.dyh.entity.Menu;
import com.dyh.entity.User;
import com.dyh.service.MenuService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author daiyuhua
 */
@RestController
@Slf4j
@RequestMapping("/oasys-back-end")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @PostMapping(value = "/initialMenu")
    @ResponseBody
    public List<Menu> initMenu(@RequestBody User user){
        log.info("有东西进来");
        return menuService.findMenuByRoleId(user.getUsername());
    }
}
