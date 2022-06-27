package com.dyh.service;

import com.dyh.dao.CheckDao;
import com.dyh.entity.Check;
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
public class CheckService {
    @Autowired
    private CheckDao checkDao;

    public Boolean addCheck(Check check){
        return checkDao.addCheck(check);
    }
}
