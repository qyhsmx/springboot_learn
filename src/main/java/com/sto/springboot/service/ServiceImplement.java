package com.sto.springboot.service;

import com.sto.springboot.entity.InfoComponent;
import com.sto.springboot.entity.PageModel;
import com.sto.springboot.entity.User;
import com.sto.springboot.mapper.UserMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * userservice具体实现
 */
@Service
public class ServiceImplement implements UserService{


    @Autowired
    private UserMapper usermapper;

    @Override
    public User getUser(int id) {

        User user = usermapper.selectUserById(id);

        return user;
    }

    @Override
    public List<User> findAll() {

        List<User> users = usermapper.findAll();

        return users;
    }

    @Override
    public InfoComponent findAllByPage(int pageNum) {

        /**
         * 封装分页信息
         */
        PageModel pageModel = new PageModel();
        pageModel.setFirstPage(1);
        pageModel.setPageSize(2);
        int totalCount = usermapper.selectTotalCount();
        pageModel.setTotalCount(totalCount);
        int totalPage = totalCount%pageModel.getPageSize()==0?
                totalCount/pageModel.getPageSize():totalCount/pageModel.getPageSize()+1;
        pageModel.setTotalPage(totalPage);
        pageModel.setLastPage(totalPage);
        pageModel.setNowPage(pageNum);

        /**
         * 封装用户信息
         */
        List<User> users = usermapper.findAllByPage((pageNum - 1) * 2, 2);

        /**
         * 封装用户和分页信息
         */
        InfoComponent infoComponent  = new InfoComponent();
        infoComponent.setPageModel(pageModel);
        infoComponent.setUsers(users);




        return infoComponent;
    }
}
