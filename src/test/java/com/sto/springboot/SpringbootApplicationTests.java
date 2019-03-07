package com.sto.springboot;

import com.sto.springboot.entity.Employee;
import com.sto.springboot.entity.User;
import com.sto.springboot.mapper.EmpMapper;
import com.sto.springboot.mapper.UserMapper;
import org.apache.catalina.core.ApplicationContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootApplicationTests {


    @Autowired
    DataSource dataSource;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private EmpMapper empMapper;

    @Test
    public void contextLoads()throws Exception {

        List<User> list = userMapper.findAll();
        System.out.println("user的内容是："+list);


        System.out.println("数据源是"+dataSource.getClass().getName());
        System.out.println("数据源具体配置是：");

    }

    @Test
    public void test2(){
        List<Employee> emps = empMapper.queryEmpsByPage(0, 2, "110", "李");
        System.out.println(emps);

    }

    @Test
    public void insertData(){

    }



}

