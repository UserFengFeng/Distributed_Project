package com.rl.ecps.model;

import java.util.List;

public class Page {
    // 当前页码(已知)
    private int pageNo = 1;
    // 每页记录数(已知)
    private int pageSize = 5;
    // 指定的查询条件下的总记录数
    private int totalCount = 0;
    // 指定的查询条件下的总页数
    private int totalPage = 1;
    // 查询的开始行号
    private int startNum = 0;
    // 查询的结束行号
    private int endNum = 0;
    // 查询的结果集
    private List<?> list;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    /*
     * totalCount     pageSize    totalPage
     *      0            10          1
     *      100          10          10
     *      92           10          10
     * */
    public int getTotalPage() {
        totalPage = totalCount / pageSize;
        if (totalCount == 0 || totalCount % pageSize != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartNum() {
        return (pageNo - 1) * pageSize;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getEndNum() {
        return pageNo * pageSize + 1;
    }

    public void setEndNum(int endNum) {
        this.endNum = endNum;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }
}
