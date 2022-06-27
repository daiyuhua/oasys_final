package com.dyh.dao;

import com.dyh.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author daiyuhua
 */
@Mapper
public interface UserDao{
    /**
     * 登录检测
     * @param username
     * @param password
     * @return User
     */
    User checkLogin(String username, String password);

    List<User> findAllUser(Integer page,Integer size,@Param("keyword")String keyword,String fatherRole);

    List<User> findUserByKeyword(@Param("keyword")String keyword);

    Integer getTotal();

    Boolean editUser(User user);

    Boolean addUser(User user);

    Boolean addUserRole(User user);

    Boolean editUserStatus(String workId);
}
