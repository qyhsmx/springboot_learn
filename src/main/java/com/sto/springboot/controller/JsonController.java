package com.sto.springboot.controller;


import com.sto.springboot.entity.User;
import com.sto.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JsonController {


    @Autowired
    private UserService userService;

    @GetMapping("/userInfo")
    public String getUser(Model model){

        User user = userService.getUser(1);

        model.addAttribute("userInfo",user);

        return "userinfo";
    }
}
