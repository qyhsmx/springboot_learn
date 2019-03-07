package com.sto.springboot.controller;


import com.sto.springboot.entity.InfoComponent;
import com.sto.springboot.entity.User;
import com.sto.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {


    @Autowired
    private UserService service;

    /**
     * 未分页
     * @param model
     * @return
     */
    @GetMapping("/all")
    public String findAll(Model model){

        List<User> users = service.findAll();

        model.addAttribute("users",users);

        return "userinfo";
    }


    /**
     * 跳页处理的controller
     * @param model
     * @param pageNum
     * @return
     */
    @GetMapping("/page")
    public String findAllByPage(Model model,
                                @RequestParam(value = "pageNum",defaultValue = "1") int pageNum){

        InfoComponent pageinfo = service.findAllByPage(pageNum);
        model.addAttribute("pageinfo",pageinfo);

        return "userinfo";
    }
}
