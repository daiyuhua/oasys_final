package com.dyh.service;

import com.dyh.Bean.RespPageBean;
import com.dyh.dao.VacationDao;
import com.dyh.entity.Report;
import com.dyh.entity.Resign;
import com.dyh.entity.Vacation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;


/**
 * @author daiyuhua
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
public class VacationService {
    @Autowired
    private VacationDao vacationDao;

    public Boolean addVacation(Vacation vacation){
        return vacationDao.addVacation(vacation);
    }

    public RespPageBean findAllVacation(Integer page, Integer size, String roleId){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Vacation> data = vacationDao.findAllVacation(page, size, roleId);
        Integer total = vacationDao.getTotal(roleId);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Boolean editVacationStatus(Vacation vacation){
        return vacationDao.editVacationStatus(vacation);
    }

    public Boolean addReport(Report report){
        return vacationDao.addReport(report);
    }
    public RespPageBean findVacationByWorkId(Integer page, Integer size, String workId,String keyword){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<Vacation> data = vacationDao.findVacationByWorkId(workId, page, size,keyword);
        System.out.println(data);
        Integer total = vacationDao.getTotalVacation(workId);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Report findReportByVacationId(String vacationId){
        return vacationDao.findReportByVacationId(vacationId);
    }

    public Boolean editReport(Report report){
        return vacationDao.editReport(report);
    }

    public Vacation findVacationByWorkIdAndStatus(String workId){
        return vacationDao.findVacationByWorkIdAndStatus(workId);
    }

    public Boolean editVacation(Vacation vacation){
        Boolean flag = false;
        flag = vacationDao.editVacation(vacation);
        if (flag == true){
            return flag;
        }else {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return flag;
        }
    }
}
