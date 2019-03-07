package com.sto.springboot.mapper;


import com.sto.springboot.entity.User;

import java.util.List;


public interface UserMapper {


    User selectUserById(Integer id);

    void insertUser(User user);

    List<User> findAll();

    List<User> findAllByPage(int beginIndex,int pageSize);

    /**
     * 查询总记录数
     * @return
     */
    int selectTotalCount();


}
