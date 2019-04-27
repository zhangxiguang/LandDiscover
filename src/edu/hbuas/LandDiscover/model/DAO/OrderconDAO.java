package edu.hbuas.LandDiscover.model.DAO;


import edu.hbuas.LandDiscover.model.javaBean.Order;

import java.util.List;

public interface OrderconDAO {

        //查询全部订单
        public List<Order> Ordercontent(int userid);

        //查询出行订单
        public  List<Order> CxOrder(int userid);

        //查询未出行订单
        public List<Order> WcxOrder(int userid);

        //删除订单
        public boolean deletorder(String orderId);

//        public List<Order> fenye(int userid,int num,int Page);

//        public int yeshu(int num,int userid);
}
