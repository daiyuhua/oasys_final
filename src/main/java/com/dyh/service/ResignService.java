package com.dyh.service;

import com.dyh.Bean.RespPageBean;
import com.dyh.dao.ResignDao;
import com.dyh.entity.Resign;
import com.dyh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.event.TransactionalEventListener;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

/**
 * @author daiyuhua
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
public class ResignService{
    final ResignDao resignDao;

    public ResignService(ResignDao resignDao) {
        this.resignDao = resignDao;
    }

    public Boolean addResignApply(Resign resign) {
        Boolean flag = false;
        Resign resignTmp = resignDao.findResignByWorkId(resign.getWorkId());
        if (resignTmp == null){
            flag = resignDao.addResignApply(resign);
            if (flag == true){
                return flag;
            }else {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return flag;
            }
        }else {
            return flag;
        }
    }

    public Boolean editResignApplyStatus(Resign resign){
        return resignDao.editResignApplyStatus(resign);
    }

    public RespPageBean findAllApply(Integer page,Integer size,String roleId,String keyword){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        System.out.println(keyword);
        List<Resign> data = resignDao.findAllApply(page, size, roleId, keyword);
        System.out.println(data);
        Integer total = resignDao.getTotal(roleId);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Resign findResignByWorkId(String workId){
        return resignDao.findResignByWorkId(workId);
    }
}
