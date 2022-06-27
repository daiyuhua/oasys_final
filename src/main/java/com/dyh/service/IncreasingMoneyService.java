package com.dyh.service;

import com.dyh.Bean.RespPageBean;
import com.dyh.dao.IncreasingMoneyDao;
import com.dyh.entity.Employee;
import com.dyh.entity.IncreasingMoney;
import com.dyh.entity.Vacation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author daiyuhua
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
public class IncreasingMoneyService {
    @Autowired
    private IncreasingMoneyDao increasingMoneyDao;
    @Resource
    private EmployeeService employeeService;


    public RespPageBean findIncreasingMoneyByWorkId(String workId,Integer page,Integer size){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<IncreasingMoney> data = increasingMoneyDao.findIncreasingMoneyByWorkId(workId, page, size);
        Integer total = increasingMoneyDao.getTotalIncreaseMoney(workId);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Boolean addIncreasingMoney(IncreasingMoney increasingMoney){
        return increasingMoneyDao.addIncreasingMoney(increasingMoney);
    }

    public IncreasingMoney checkSame(String workId,String applyDate){
        return increasingMoneyDao.checkSame(workId,applyDate);
    }

    public RespPageBean findAllIncreasingApply(String office,Integer page,Integer size){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<IncreasingMoney> data = increasingMoneyDao.findAllIncreasingApply(office, page, size);
        Integer total = increasingMoneyDao.getTotalIncreasingApply(office);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Boolean editApplyStatus(IncreasingMoney increasingMoney){
        return increasingMoneyDao.editApplyStatus(increasingMoney);
    }

    public RespPageBean findAllPassApply(Integer page,Integer size){
        if (page != null && size != null) {
            page = (page - 1) * size;
        }
        List<IncreasingMoney> data = increasingMoneyDao.findAllPassApply(page, size);
        Integer total = increasingMoneyDao.getTotalPassApply();
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }
    public Boolean editMoneyOfficeStatus(IncreasingMoney increasingMoney){
        Boolean flag = false;
        flag = increasingMoneyDao.editMoneyOfficeStatus(increasingMoney);
        if (flag == true ){
            Employee employee = increasingMoney.getEmployee();
            employee.setWorkId(increasingMoney.getWorkId());
            flag = employeeService.editEmployeeMoney(employee);
            System.out.println(flag);
            if (flag == true){
                return flag;
            }else {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return flag;
            }
        } else {
            return flag;
        }
    }
}
