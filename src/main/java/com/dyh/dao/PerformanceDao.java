package com.dyh.dao;

import com.dyh.entity.Performance;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author daiyuhua
 */

@Mapper
public interface PerformanceDao {
    /**
     * 通过用户工号查找所有绩效考核
     * @param workId
     * @param page
     * @param size
     * @return
     */
    public List<Performance> findAllPerformanceByWorkId(String workId,Integer page,Integer size);

    /**
     * findAllPerformanceByWorkId的分页总数
     * @param workId
     * @return
     */
    public Integer getTotalPerformanceByWorkId(String workId);

    /**
     * 添加业绩考核
     * @param performance
     * @return
     */
    public Boolean addPerformance(Performance performance);

    /**
     * 修改复核状态
     * @param isReCheck
     * @param workId
     * @param applyDate
     * @return
     */
    public Boolean editIsReCheck(String isReCheck,String workId,String applyDate);

    /**
     * 获取所有复核申请
     * @param office
     * @param page
     * @param size
     * @return
     */
    public List<Performance> findAllReCheckByOffice(String office,Integer page,Integer size);

    /**
     * 获取申请复核总数
     * @param office
     * @return
     */
    public Integer getTotalReCheck(String office);


    /**
     * 修改复核状态
     * @param performance
     * @return
     */
    public Boolean editReCheckStatus(Performance performance);

    /**
     * 查询未通过考核的次数
     * @param workId
     * @return
     */
    public Integer getTotalUnPassPerformance(String workId);

}
