package edu.hbuas.LandDiscover.model.javaBean;

import java.util.ArrayList;
import java.util.List;

public class Page {
    private int page;       //当前页
    private int pageSize;       //页面数据条数
    private int indexPage=1;        //首页
    private int endPage;        //尾页
    private int count;          //总数据条数
    private int pageNumber;     //总页面数
    private List<Order> orderList;      //得到的数据放入list集合中

    public Page() {
    }

    public Page(int page, int pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    //总页面数
    public int getCount(){
        return this.count = orderList.size();
    }

    private int getEndPage(){
        //数据总条数
        int countNum = this.getCount();
        //最后一页的页码
        int end = countNum / this.pageSize;
        if(countNum % this.pageSize > 0){
            return end + 1;
        }
        return end;
    }

    public List<Order> getPageByPageAndCount(){
        if(page == this.indexPage){
            page = indexPage;
        }
        if(page > this.getCount()){
            page = this.getCount();
        }
        List<Order> list = new ArrayList<>();
        int first = (page - 1) * pageSize;
        int end = page * pageSize;
        int countNum = this.getCount();
        int panDuan = countNum % this.pageSize;
        if(end > countNum){
            end = countNum;
        }
        for(int i = first; i < end; i++){
            list.add(orderList.get(i));
        }
        return list;
    }
}
