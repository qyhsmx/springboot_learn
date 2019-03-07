package com.sto.springboot.service;


import com.sto.springboot.entity.InfoComponent;
import com.sto.springboot.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户service接口
 */

public interface UserService {
    /**
     * javadoc
     * id 查询的id
     * @return
     */
    User getUser(int id);

    List<User> findAll();

    InfoComponent findAllByPage(int pageNum);
}
