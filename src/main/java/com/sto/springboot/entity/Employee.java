package com.sto.springboot.entity;

public class Employee {
    private int id;
    private int code;
    private String userName;
    private String realName;
    private String nickName;
    private String duty;
    private String title;

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", code=" + code +
                ", userName='" + userName + '\'' +
                ", realName='" + realName + '\'' +
                ", nickName='" + nickName + '\'' +
                ", duty='" + duty + '\'' +
                ", title='" + title + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Employee(int id, int code, String userName, String realName, String nickName, String duty, String title) {
        this.id = id;
        this.code = code;
        this.userName = userName;
        this.realName = realName;
        this.nickName = nickName;
        this.duty = duty;
        this.title = title;
    }

    public Employee() {
    }
}
