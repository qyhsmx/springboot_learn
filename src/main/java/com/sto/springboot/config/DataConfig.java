package com.sto.springboot.config;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * 数据源的配置类
 * @author qyy
 */
@Configuration
public class DataConfig {

    /**
     * 把数据源的配置信息加入到容器中
     * @return
     */
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        return dataSource;
    }

    /**
     * 配置druid监控信息
     * @return
     */
    @Bean
    public ServletRegistrationBean viewSet(){
        ServletRegistrationBean bean =
                new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        Map<String, String> initParams = new HashMap<>(20);
        initParams.put("jmxUsername","root");
        initParams.put("jmxPassword","root");
        bean.setInitParameters(initParams);
        return bean;
    }

    /**
     *
     * 配置一个web监控的filter
     */
    @Bean
    public FilterRegistrationBean webStatFilter(){

        FilterRegistrationBean bean = new FilterRegistrationBean();

        bean.setFilter(new WebStatFilter());

        Map<String,String> initParams = new HashMap<>();
        initParams.put("exclusions","*.js,*.css,/druid/*");

        bean.setInitParameters(initParams);

        /*bean.setUrlPatterns(Arrays.asList("/*"));*/

        return  bean;
    }


}
