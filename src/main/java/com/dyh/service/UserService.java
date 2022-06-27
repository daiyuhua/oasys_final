package com.dyh.service;

import com.dyh.Bean.RespPageBean;
import com.dyh.dao.UserDao;
import com.dyh.entity.User;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author daiyuhua
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
public class UserService {
    @Autowired
    private UserDao userDao;

    public User checkLogin(String username, String password){
        return userDao.checkLogin(username, password);
    }

    public RespPageBean findAllUser(Integer page, Integer size,String keyword,String fatherRole){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<User> data = userDao.findAllUser(page, size,keyword, fatherRole);
        Integer total = userDao.getTotal();
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Boolean editUser(User user){
        return userDao.editUser(user);
    }

    public Boolean addUser(User user){
        return userDao.addUser(user);
    }

    public Boolean addUserRole(User user){
        return userDao.addUserRole(user);
    }

    public Boolean editUserStatus(String workId){
        return userDao.editUserStatus(workId);
    }

    public List<User> findAllUser(String Keyword,String fatherRole){
        return userDao.findAllUser(null,null,Keyword,fatherRole);
    }
}
