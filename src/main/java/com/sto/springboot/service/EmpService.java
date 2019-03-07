package com.sto.springboot.service;

import com.sto.springboot.entity.Employee;

import java.util.List;
import java.util.Map;

public interface EmpService {

    /**
     *
     * @param param
     * @return
     */
    List<Employee> queryEmps(Map<String,String> param);

    /**
     * 查询总记录数
     * @return
     */
    int queryTotalCounts();

    /**
     * 根据id查找
     * @param id
     * @return
     */
    Employee findEmpById(int id);

    /**
     *
     * @param
     * @return
     */
    List<Employee> queryByCodeAndUsername(Map<String,String> map);

}
