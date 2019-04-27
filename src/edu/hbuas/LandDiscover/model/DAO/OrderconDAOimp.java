package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderconDAOimp extends BaseDAOimp implements OrderconDAO {


    @Override
    public boolean deletorder(String orderId) {
        boolean b = false;
        String SQL = "delete from orderinfo where orderId = ?";


        try {
            PreparedStatement pre = getPre(SQL);
            pre.setString(1,orderId);
            int rs = pre.executeUpdate();
            if (rs > 0 ){
                b = true;
            }else {
                b = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }

    //出行订单
    @Override
    public List<Order> CxOrder(int userid) {

        List<Order> od = new ArrayList<>();
        String SQL = "select * from orderinfo o,account a where o.userid = a.userid and a.userid = ? and o.ordStatus = 1";


        try {
            PreparedStatement pre = getPre(SQL);
            pre.setInt(1,userid);

            ResultSet rs = pre.executeQuery();
            if (rs == null){
                return null;
            }else {


            while (rs.next()){
                Order o = new Order();

                o.setUserId(rs.getInt("userId"));
                o.setToId(rs.getString("toId"));
                o.setOrderId(rs.getInt("orderId"));
                o.setTime(rs.getString("time"));
                o.setFromId(rs.getString("fromId"));
                o.setHumans(rs.getInt("human"));
                o.setStatus(rs.getString("ordStatus"));

                o.setScenery(rs.getString("scenery"));
                o.setEndDate(rs.getString("endTime"));
                o.setCar(rs.getString("car"));
                o.setHotel(rs.getString("hotel"));

                od.add(o);
            }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return od;
    }


    //未出行订单
    @Override
    public List<Order> WcxOrder(int userid) {
        List<Order> od = new ArrayList<>();
        String SQL = "select * from orderinfo o,account a where o.userid = a.userid and a.userid = ? and o.ordStatus = 0 ";


        try {
            PreparedStatement pre = getPre(SQL);
            pre.setInt(1,userid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                Order o = new Order();

                o.setUserId(rs.getInt("userId"));
                o.setToId(rs.getString("toId"));
                o.setTime(rs.getString("time"));
                o.setOrderId(rs.getInt("orderId"));
                o.setFromId(rs.getString("fromId"));
                o.setHumans(rs.getInt("human"));
                o.setEndDate(rs.getString("endTime"));
                o.setFromId(rs.getString("fromId"));
                o.setHotel(rs.getString("hotel"));
                o.setScenery(rs.getString("scenery"));
                o.setCar(rs.getString("car"));
                o.setStatus(rs.getString("ordStatus"));

                od.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return od;
    }


    //全部订单
    @Override
    public List<Order> Ordercontent(int userid) {
        System.out.println("进入Ordercontent");

        List<Order> od = new ArrayList<>();
        String SQL = "select * from orderinfo o,account a where o.userid = a.userid and a.userid = ? ";
        //select * from orderinfo o,account a where o.userid = a.userid and a.userid = 1


        try {
            PreparedStatement pre = getPre(SQL);
            pre.setInt(1,userid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                Order o = new Order();

                o.setCar(rs.getString("car"));
                o.setStatus(rs.getString("ordStatus"));
                o.setHotel(rs.getString("hotel"));
                o.setScenery(rs.getString("scenery"));
                o.setEndDate(rs.getString("endTime"));
                o.setFromId(rs.getString("fromId"));
                o.setHumans(rs.getInt("human"));
                o.setMoney(rs.getDouble("allMoney"));
                o.setStartDate(rs.getString("startTime"));
                o.setTime(rs.getString("time"));
                o.setOrderId(rs.getInt("orderId"));
                o.setToId(rs.getString("toId"));
                o.setUserId(rs.getInt("userId"));
                od.add(o);
            }
            System.out.println("完成Ordercontent");
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return od;
    }
}
