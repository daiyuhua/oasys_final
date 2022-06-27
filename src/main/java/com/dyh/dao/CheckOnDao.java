package com.dyh.dao;

import com.dyh.entity.CheckOn;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface CheckOnDao {
    public Boolean normalCheckOn(CheckOn checkOn);
    public List<CheckOn> findAllCheckOnByWorkId(Integer page,Integer size,String workId);
    public Integer getTotal(String workId);
    public Integer getTotalByWorkIdAndDate(String workId,String date);
}
