package com.sto.springboot.controller;


import com.alibaba.fastjson.JSON;
import com.sto.springboot.entity.Employee;
import com.sto.springboot.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/employee")
public class EmpController {

    @Autowired
    private EmpService empService;


    @GetMapping("/login")
    public String login(){
        return "employee";
    }

    /**
     * //每页多少条数据
     *                 pSize: params.pageSize,
     *                 //请求第几页
     *                 cPage: params.pageNumber,
     *                 code: $("#code").val(),
     *                 userName: $("#userName").val()
     *                 Integer pageSize,Integer offset,Integer code,String userName
     * @return
     */
    @PostMapping ("/queryData")
    @ResponseBody
    public Object employee(@RequestParam Map<String,String> param){

        System.out.println(param);


        if(param.get("pageSize")==null) {
            param.put("pageSize","1000");
        }
        if(param.get("offset")==null){
            param.put("offset","0");
        }
        if(param.get("code")=="" || param.get("code")==null){
            param.put("code",null);
        }
        if(param.get("userName")=="" || param.get("userName")==null){
            param.put("userName",null);
        }


        Map<String,Object> map = new HashMap<>();

        //查询总条数
        int counts = empService.queryTotalCounts();

        //查询数据
        List<Employee> employees = empService.queryEmps(param);

        map.put("total",counts);

        map.put("rows",employees);

        String jsonString = JSON.toJSONString(map);

        return jsonString;
    }

    /**
     *
     * @param id
     * @return
     */
    @GetMapping("/modifyemployee")
    @ResponseBody
   public ModelAndView modifyEmp(@RequestParam("id") int id){

        Employee emp = new Employee();

        try{
             emp = empService.findEmpById(id);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("未查询到数据");
        }



        ModelAndView model = new ModelAndView();

        model.setViewName("employeeadd");

        model.addObject("employee",emp);

        return model;
   }

    /**
     * 条件查询
     * @param
     * @return
     */
   @ResponseBody
   @PostMapping("/queryByCodeAndUsername")
   public Object queryByCodeAndUsername(@RequestParam Map<String,String> map){

       System.out.println("访问此方法，map值为"+map);

       String code = map.get("code");

       List<Employee> employees = empService.queryByCodeAndUsername(map);


       return JSON.toJSON(employees);



   }
}
