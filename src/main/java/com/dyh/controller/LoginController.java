package com.dyh.controller;

import com.dyh.Bean.RespBean;
import com.dyh.entity.User;
import com.dyh.service.UserService;
import jdk.nashorn.internal.runtime.logging.Logger;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;


/**
 * @author daiyuhua
 */
@Slf4j
@RestController
@RequestMapping("/oasys-back-end")
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public RespBean test(@RequestBody User user, HttpServletResponse res){
        if(user!=null){
            User userTmp = userService.checkLogin(user.getUsername(),user.getPassword());
            if (userTmp!=null){
                if("未注销".equals(userTmp.getStatus())){
                    log.info("登录成功");
                    System.out.println(userTmp);
                    return RespBean.ok("登录成功",userTmp);
                }else{
                    log.info("登录失败");
                    return RespBean.error("用户已经注销账号");
                }

            }else{
                log.warn("登录用户账户名或密码错误");
                return RespBean.error("用户名或密码错误");
            }
        }
        log.warn("用户未输入任何数据，请注意是否为恶意登录");
        return RespBean.error("用户名与密码不能为空");
    }
}
