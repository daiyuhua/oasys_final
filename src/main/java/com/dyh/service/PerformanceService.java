package com.dyh.service;

import com.alibaba.druid.sql.ast.statement.SQLRollbackStatement;
import com.dyh.Bean.RespPageBean;
import com.dyh.dao.CheckOnDao;
import com.dyh.dao.EmployeeDao;
import com.dyh.dao.PerformanceDao;
import com.dyh.dao.UserDao;
import com.dyh.entity.CheckOn;
import com.dyh.entity.Performance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;


/**
 * @author daiyuhua
 * @date 2021-11-25
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
public class PerformanceService {
    final PerformanceDao performanceDao;
    final CheckOnDao checkOnDao;
    final EmployeeDao employeeDao;
    final UserDao userDao;

    public PerformanceService(PerformanceDao performanceDao, CheckOnDao checkOnDao,EmployeeDao employeeDao,UserDao userDao) {
        this.performanceDao = performanceDao;
        this.checkOnDao = checkOnDao;
        this.employeeDao = employeeDao;
        this.userDao = userDao;
    }

    /**
     * 通过工号查找所有业绩考核并进行分页数据获取
     *
     * @param workId
     * @param page
     * @param size
     * @return
     */
    public RespPageBean findAllPerformanceByWorkId(String workId, Integer page, Integer size) {
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        RespPageBean respPageBean = new RespPageBean();
        //System.out.println("??"+performanceDao.getTotalPerformanceByWorkId(workId));
        List<Performance> performanceList = performanceDao.findAllPerformanceByWorkId(workId, page, size);
        //System.out.println(performanceList);
        respPageBean.setData(performanceList);

        respPageBean.setTotal(performanceDao.getTotalPerformanceByWorkId(workId));
        return respPageBean;
    }

    /**
     * 添加业绩考核
     * @param performance
     * @return
     */
    public Boolean addPerformance(Performance performance) {
        Integer checkOnDay = checkOnDao.getTotalByWorkIdAndDate(performance.getWorkId(),performance.getApplyDate().substring(0,7));
        System.out.println(checkOnDay);
        if (checkOnDay >= 0) {
            performance.setCheckOnDay(checkOnDay);
            Integer year = Integer.parseInt(performance.getApplyDate().substring(0, 4));
            Integer month = Integer.parseInt(performance.getApplyDate().substring(5, 7));
            Double checkOnPercent = 0.0;
            System.out.println("year=" + year + "\n" + "month=" + month);
            switch (month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    checkOnPercent = (double)checkOnDay/(double) 31;
                    System.out.println(checkOnDay/31);
                    System.out.println(checkOnPercent);
                    performance.setCheckOnPercent(checkOnPercent);
                    if (checkOnPercent<0.6){
                        performance.setPerformanceStatus("未通过");
                    }else {
                        performance.setPerformanceStatus("通过");
                    }
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    checkOnPercent = Double.valueOf(checkOnDay / 31);
                    performance.setCheckOnPercent(checkOnPercent);
                    if (checkOnPercent<0.6){
                        performance.setPerformanceStatus("未通过");
                    }else {
                        performance.setPerformanceStatus("通过");
                    }
                    break;
                case 2:
                    if (year % 4 == 0 || year % 100 == 0 || year % 400 == 0) {
                        checkOnPercent = Double.valueOf(checkOnDay / 31);
                        performance.setCheckOnPercent(checkOnPercent);
                        if (checkOnPercent<0.6){
                            performance.setPerformanceStatus("未通过");
                        }else {
                            performance.setPerformanceStatus("通过");
                        }
                    } else {
                        checkOnPercent = Double.valueOf(checkOnDay / 31);
                        performance.setCheckOnPercent(checkOnPercent);
                        if (checkOnPercent<0.6){
                            performance.setPerformanceStatus("未通过");
                        }else {
                            performance.setPerformanceStatus("通过");
                        }
                    }
                    break;
            }
            return performanceDao.addPerformance(performance);
        }
        return performanceDao.addPerformance(performance);
    }

    /**
     * 修改业绩复核状态
     * @param isReCheck
     * @return
     */
    public Boolean editIsReCheck(String isReCheck,String workId,String applyDate){
        Boolean flag = false;
        flag = performanceDao.editIsReCheck(isReCheck, workId, applyDate);
        System.out.println(workId+"\n"+applyDate);
        if (flag == true){
            return flag;
        }
        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        return flag;
    }

    public RespPageBean findAllReCheckByOffice(String office,Integer page,Integer size){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        RespPageBean respPageBean = new RespPageBean();
        respPageBean.setData(performanceDao.findAllReCheckByOffice(office, page, size));
        respPageBean.setTotal(performanceDao.getTotalReCheck(office));
        return respPageBean;
    }

    public Boolean editReCheckStatus(Performance performance){
        Boolean flag = false;
        flag = performanceDao.editReCheckStatus(performance);
        if (flag == true){
            Integer times = performanceDao.getTotalUnPassPerformance(performance.getWorkId());
            System.out.println(flag);
            if (times > 3){
                flag = employeeDao.editEmployeeStatus(performance.getWorkId());
                System.out.println("flag1="+flag);
                if (flag == true){
                    flag = userDao.editUserStatus(performance.getWorkId());
                    System.out.println("flag2="+flag);
                    if (flag == true){
                        return flag;
                    }else {
                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        return flag;
                    }
                }else {
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return flag;
                }
            }
            return flag;
        }else {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return flag;
        }
    }
}
