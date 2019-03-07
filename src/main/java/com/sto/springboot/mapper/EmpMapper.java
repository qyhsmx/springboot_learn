package com.sto.springboot.mapper;

import com.sto.springboot.entity.Employee;

import java.util.List;
import java.util.Map;

public interface EmpMapper {

    List<Employee> queryEmpsByPage(int offset,int pageSize,String code,String userName);

    int queryTotals();

    Employee findEmpById(int id);

    List<Employee> queryByCodeAndUsername(Map<String, String> map);
}
