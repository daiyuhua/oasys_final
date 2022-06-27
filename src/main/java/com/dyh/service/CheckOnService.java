package com.dyh.service;

import com.dyh.Bean.RespPageBean;
import com.dyh.dao.CheckOnDao;
import com.dyh.entity.CheckOn;
import com.dyh.entity.Vacation;
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
public class CheckOnService {
    @Autowired
    private CheckOnDao checkOnDao;

    public Boolean normalCheckOn(CheckOn checkOn){
        return checkOnDao.normalCheckOn(checkOn);
    }

    public RespPageBean findAllCheckOnByWorkId(Integer page,Integer size,String workId){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<CheckOn> data = checkOnDao.findAllCheckOnByWorkId(page,size,workId);
        Integer total = checkOnDao.getTotal(workId);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }
}
