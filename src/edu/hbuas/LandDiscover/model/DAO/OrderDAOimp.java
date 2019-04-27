package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OrderDAOimp extends BaseDAOimp implements OrderDAO {

    //添加景点
    @Override
    public Boolean addScenery(Account account, Order order) {
        Account acc = account;
        int userId = acc.getUserId();
        System.out.println("要添加订单信息的userId为："+userId);
        Order ord = order;
        String scenery = ord.getScenery();
        System.out.println("要添加的景点是:"+scenery);

        //连接数据库，查看用户是否已经生成订单

        try {
            String sql = "select * from orderInfo where userId=? and ordStatus = 'noMove' ";
            PreparedStatement pre = getPre(sql);
            pre.setInt(1,userId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                //获取该用户的订单编号
                int orderId = rs.getInt("orderId");
                System.out.println("当前用户为出行的orderId为:"+orderId);
                //更新用户订单数据
                String sql2 = "UPDATE orderInfo SET scenery = "+scenery+" WHERE orderId = "+orderId;
                Statement sta= getSta();
                int rs2 = sta.executeUpdate(sql2);
                System.out.println("更新订单的结果为:"+rs2);
                if (rs2==1) {
                    System.out.println("更新添加景点信息操作成功");
                    return true;
                } else {
                    System.out.println("更新添加景点信息操作失败");
                    return false;
                }

            } else {
                System.out.println("未查询到当前用户的订单信息");
                //用户没有创建订单，新建用户订单
                String sql3 = "INSERT into orderInfo (userId,scenery) VALUES("+userId+","+scenery+")";
                Statement sta2=getSta();
                System.out.println(sta2);
                int rs3=sta2.executeUpdate(sql3);
                System.out.println("创建订单的结果为:"+rs3);
                if (rs3==1) {
                    //创建用户订单成功
                    System.out.println("创建用户订单成功");
                    return true;
                } else {
                    System.out.println("创建用户订单失败");
                    return false;
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }



    }


    //添加宾馆
    @Override
    public Boolean addHotel(Account account, Order order) {
        Account acc = account;
        int userId = acc.getUserId();
        System.out.println("要添加订单信息的userId为："+userId);
        Order ord = order;
        String hotel = ord.getHotel();
        System.out.println("要添加的宾馆是:"+hotel);

        //连接数据库，查看用户是否已经生成订单

        try {
            String sql = "select * from orderInfo where userId=? and ordStatus = 'noMove' ";
            PreparedStatement pre = getPre(sql);
            pre.setInt(1,userId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                //获取该用户的订单编号
                int orderId = rs.getInt("orderId");
                System.out.println("当前用户未出行的orderId为:"+orderId);
                //更新用户订单数据
                String sql2 = "UPDATE orderInfo SET hotel = "+hotel+" WHERE orderId = "+orderId;
                Statement sta= getSta();
                int rs2 = sta.executeUpdate(sql2);
                System.out.println("更新订单的结果为:"+rs2);
                if (rs2==1) {
                    System.out.println("更新添加宾馆信息操作成功");
                    return true;
                } else {
                    System.out.println("更新添加宾馆信息操作失败");
                    return false;
                }

            } else {
                System.out.println("未查询到当前用户的订单信息");
                //用户没有创建订单，新建用户订单
                String sql3 = "INSERT into orderInfo (userId,hotel) VALUES("+userId+","+hotel+")";
                Statement sta2=getSta();
                System.out.println(sta2);
                int rs3=sta2.executeUpdate(sql3);
                System.out.println("创建订单的结果为:"+rs3);
                if (rs3==1) {
                    //创建用户订单成功
                    System.out.println("创建用户订单成功");
                    return true;
                } else {
                    System.out.println("创建用户订单失败");
                    return false;
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    //添加汽车
    @Override
    public Boolean addCar(Account account, Order order) {
        Account acc = account;
        int userId = acc.getUserId();
        System.out.println("要添加订单信息的userId为："+userId);
        Order ord = order;
        String car = ord.getCar();
        System.out.println("要添加的宾馆是:"+car);

        //连接数据库，查看用户是否已经生成订单

        try {
            String sql = "select * from orderInfo where userId=? and ordStatus = 'noMove' ";
            PreparedStatement pre = getPre(sql);
            pre.setInt(1,userId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                //获取该用户的订单编号
                int orderId = rs.getInt("orderId");
                System.out.println("当前用户未出行的orderId为:"+orderId);
                //更新用户订单数据
                String sql2 = "UPDATE orderInfo SET car = "+car+" WHERE orderId = "+orderId;
                Statement sta= getSta();
                int rs2 = sta.executeUpdate(sql2);
                System.out.println("更新订单的结果为:"+rs2);
                if (rs2==1) {
                    System.out.println("更新添加汽车信息操作成功");
                    return true;
                } else {
                    System.out.println("更新添加汽车信息操作失败");
                    return false;
                }

            } else {
                System.out.println("未查询到当前用户的订单信息");
                //用户没有创建订单，新建用户订单
                String sql3 = "INSERT into orderInfo (userId,car) VALUES("+userId+","+car+")";
                Statement sta2=getSta();
                System.out.println(sta2);
                int rs3=sta2.executeUpdate(sql3);
                System.out.println("创建订单的结果为:"+rs3);
                if (rs3==1) {
                    //创建用户订单成功
                    System.out.println("创建用户订单成功");
                    return true;
                } else {
                    System.out.println("创建用户订单失败");
                    return false;
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    //查询当前用户订单的所有信息
    @Override
    public Order allOrderInfo(Account account) {
        int money=0;
        Account acc = account;
        int userId = acc.getUserId();
        System.out.println("要查询订单信息的userId为："+userId);

        //连接数据库，查看用户是否已经生成订单

        try {
            //String sql = "select * from orderInfo where userId=? and ordStatus = 'noMove' ";
            String sql="SELECT * FROM orderInfo o,Car c,hotel h,places p where userId=? and ordStatus = '0' and o.scenery=p.id and o.car =c.carid and o.hotel=h.hotelid ";
            PreparedStatement pre = getPre(sql);
            pre.setInt(1,userId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Order order=new Order();
                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setFromId(rs.getString("fromId"));
                order.setToId(rs.getString("toID"));
                order.setStartDate(rs.getString("startTime"));
                order.setEndDate(rs.getString("endTime"));
                order.setTime(rs.getString("time"));

                order.setScenery(rs.getString("name"));
                order.setHotel(rs.getString("hotelname"));
                order.setCar(rs.getString("carName"));

                order.setStatus(rs.getString("ordStatus"));

                int carMoney=rs.getInt("carPrice");
                int hotelMoney=rs.getInt("hotelprice");
                int placeMoney=rs.getInt("price");

                money=carMoney+hotelMoney+placeMoney;

//                System.out.println("carMOney:"+carMoney+"hotelMoney:+"+hotelMoney+"placeMoney:"+placeMoney+"allMOney:"+money);

                order.setMoney(money);



//                order.setHumans(rs.getInt("human"));
//                order.setMoney(rs.getInt("price"));

                //更多信息需要添加

                System.out.println(order);

                return order;

            } else {
                //用户没有创建订单，新建用户订单
                System.out.println("未查询到当前用户的订单信息");
               return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }



    }

    @Override
    public Boolean addHuman(String orderID, String username, String telephone,int number,float money) {
        int count=0;
        System.out.println("进行添加联系人操作");
        String sql="insert into orderOwner(ordID,username,telephone) values("+orderID+",'"+username+"',"+telephone+")";
        Statement sta=getSta();
        try {
            int  rs=sta.executeUpdate(sql);

            String sql2="UPDATE orderInfo set human=?,allMoney=? where orderId=?";
            PreparedStatement pre=getPre(sql2);
            pre.setInt(1,number);
            pre.setInt(2,(int)money);
            pre.setString(3,orderID);

            int rs2=pre.executeUpdate();


            count=rs+rs2;
            if (count==2){

                return  true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }
        return null;
    }
}
