package com.sto.springboot.controller;


import com.alibaba.fastjson.JSON;
import com.sto.springboot.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class TestController {

    @Autowired
    private EmpService empService;
    //跳转的controller
    @RequestMapping("/test")
    public String dealTable(){
        return "test";
    }

    /**
     * 分页查询
     * @return
     */
    @ResponseBody
    @PostMapping("/typeahead")
    public Object data(String code){

        System.out.println("code is"+code);



        return JSON.toJSON("a,b,c".split(","));
    }


    public Object addUser(){

        return 0;
    }

}
