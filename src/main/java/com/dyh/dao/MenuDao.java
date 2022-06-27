package com.dyh.dao;

import com.dyh.entity.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface MenuDao {
    public List<Menu> findMenuByUsername(String username);
}