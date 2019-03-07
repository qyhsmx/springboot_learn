package com.sto.springboot.entity;


import java.util.List;


/**
 * 信息汇总模型
 */
public class InfoComponent {

    private PageModel pageModel;
    private List<User> users;

    public InfoComponent() {
    }

    public InfoComponent(PageModel pageModel, List<User> users) {
        this.pageModel = pageModel;
        this.users = users;
    }

    public PageModel getPageModel() {
        return pageModel;
    }

    public void setPageModel(PageModel pageModel) {
        this.pageModel = pageModel;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "InfoComponent{" +
                "pageModel=" + pageModel +
                ", users=" + users +
                '}';
    }
}
