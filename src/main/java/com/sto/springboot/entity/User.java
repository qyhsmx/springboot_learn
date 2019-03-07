/**
 *
 */
package com.sto.springboot.entity;


import org.springframework.stereotype.Repository;


public class User {
    private int id;
    private String name;
    private String mail;
    private String status;

    public User() {
    }

    public User(int id, String name, String mail, String status) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", mail='" + mail + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
