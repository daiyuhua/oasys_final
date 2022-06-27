package com.dyh.dao;

import com.dyh.entity.Check;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author daiyuhua
 */
@Mapper
public interface CheckDao {
    public Boolean addCheck(Check check);
}
