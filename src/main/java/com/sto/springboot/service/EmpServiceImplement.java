package com.sto.springboot.service;

import com.sto.springboot.entity.Employee;
import com.sto.springboot.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImplement implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    @Override
    public List<Employee> queryEmps(Map<String,String> param) {

        Integer pageSize = Integer.parseInt(param.get("pageSize"));

        Integer offset = Integer.parseInt(param.get("offset"));

        String code = param.get("code");
        System.out.println("code 的值为"+code);

        String userName = param.get("userName");
        System.out.println("userName 的值为"+userName);

        List<Employee> employees = empMapper.queryEmpsByPage(offset,pageSize,code,userName);
        return employees;
    }

    @Override
    public int queryTotalCounts() {

        return empMapper.queryTotals();

    }

    @Override
    public Employee findEmpById(int id) {
        return empMapper.findEmpById(id);

    }

    @Override
    public List<Employee> queryByCodeAndUsername(Map<String, String> map) {

        List<Employee> employees = empMapper.queryByCodeAndUsername(map);

        return employees;
    }
}
