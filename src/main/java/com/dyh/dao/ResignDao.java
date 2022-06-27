package com.dyh.dao;

import com.dyh.entity.Resign;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface ResignDao {
    public Boolean addResignApply(Resign resign);

    public Boolean editResignApplyStatus(Resign resign);

    public List<Resign> findAllApply(Integer page,Integer size,@Param("roleId") String roleId,@Param("keyword") String keyword);

    public Integer getTotal(String roleId);

    public Resign findResignByWorkId(String workId);
}
