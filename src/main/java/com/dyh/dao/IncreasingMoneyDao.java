package com.dyh.dao;

import com.dyh.entity.IncreasingMoney;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface IncreasingMoneyDao {
    public List<IncreasingMoney> findIncreasingMoneyByWorkId(String workId,Integer page,Integer size);
    public Integer getTotalIncreaseMoney(String workId);
    public Boolean addIncreasingMoney(IncreasingMoney increasingMoney);
    public IncreasingMoney checkSame(String workId,String applyDate);
    public List<IncreasingMoney> findAllIncreasingApply(String office ,Integer page,Integer size);
    public Integer getTotalIncreasingApply(String office);
    public Boolean editApplyStatus(IncreasingMoney increasingMoney);
    public List<IncreasingMoney> findAllPassApply(Integer page,Integer size);
    public Integer getTotalPassApply();
    public Boolean editMoneyOfficeStatus(IncreasingMoney increasingMoney);
}
