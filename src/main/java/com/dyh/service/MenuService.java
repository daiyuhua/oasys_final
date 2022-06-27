package com.dyh.service;

import com.dyh.dao.MenuDao;
import com.dyh.entity.Menu;
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
public class MenuService {
    @Autowired
    private MenuDao menuDao;

    public List<Menu> findMenuByRoleId(String username){
        return menuDao.findMenuByUsername(username);
    }


}
