package com.dyh.dao;

import com.dyh.entity.Report;
import com.dyh.entity.Vacation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface VacationDao {
    Boolean addVacation(Vacation vacation);
    List<Vacation> findAllVacation(Integer page,Integer size,String roleId);
    Integer getTotal(String roleId);
    Boolean editVacation(Vacation vacation);
    Boolean editVacationStatus(Vacation vacation);
    Boolean addReport(Report report);
    Report findReportByVacationId(String vacationId);
    List<Vacation> findVacationByWorkId(String workId,Integer page,Integer size,@Param("keyword") String keyword);
    Integer getTotalVacation(String workId);
    Boolean editReport(Report report);
    Vacation findVacationByWorkIdAndStatus(String workId);
}
