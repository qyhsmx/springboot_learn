package com.sto.springboot.exception;

/**
 * 自定义异常
 */
public class EmployeeException extends RuntimeException{

    public EmployeeException(){
        super();
    }

    public EmployeeException(String message) {
        super(message);
    }
}
