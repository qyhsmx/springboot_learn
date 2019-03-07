package com.sto.springboot.entity;

/**
 * 分页模型
 */
public class PageModel {
    //首页
    private int firstPage;
    //最后一页
    private int lastPage;

    private int nowPage;

    private int totalPage;

    private int totalCount;

    private int pageSize;

    @Override
    public String toString() {
        return "PageModel{" +
                "firstPage=" + firstPage +
                ", lastPage=" + lastPage +
                ", nowPage=" + nowPage +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                '}';
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public PageModel(int firstPage, int lastPage, int nowPage, int totalPage, int totalCount, int pageSize) {
        this.firstPage = firstPage;
        this.lastPage = lastPage;
        this.nowPage = nowPage;
        this.totalPage = totalPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
    }

    public PageModel() {
    }
}
