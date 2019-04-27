package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Car;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public  class CarDAOImp extends BaseDAOimp implements CarDAO {

    @Override
    public List<Car> listcarByPage(int page, int count) {
        System.out.println("进入listcarByPage");
        List<Car> hl=new ArrayList<>();
        try {
            //limit "+(page-1)*count+","+count
            ResultSet rs=getSta().executeQuery("select * from car limit "+(page-1)*count+","+count);
            while(rs.next()){
                Car h=new Car();
                h.setCarID(rs.getInt("carID"));
                h.setCarName(rs.getString("carName"));
                h.setCarImg(rs.getString("carImg"));
                h.setCarIntroduction(rs.getString("carIntroduction"));
                h.setCarPrice(rs.getInt("carPrice"));
                hl.add(h);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hl;
    }

    @Override
    public Car getCarDetailByName(String carname) {
        Car b=null;
        try {
            PreparedStatement pre=getPre("select *  from car where carName=?");
            pre.setString(1,carname);
            ResultSet rs=pre.executeQuery();
            if(rs.next()){
                b=new Car();
                b.setCarID(rs.getInt("carID"));
                b.setCarName(rs.getString("carName"));
                b.setCarImg(rs.getString("carImg"));
                b.setCarIntroduction(rs.getString("carIntroduction"));
                b.setCarPrice(rs.getInt("carPrice"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public int getSearchCount(String carname) {
        java.sql.Date sqlend_time=null;
        java.sql.Date sqlstart_time=null;



        int result=0;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try {
            String sql="select count(carID)  from car where carName=?";
            ps=getPre(sql);
            ps.setString(1,carname);
            rs =ps.executeQuery();
            rs.next();
            result=rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(result);
        return result;
    }


    @Override
    public List<Car> search(String carname,int page, int count) {



//        System.out.println("转化为数据库格式："+sqlstart_time);
//        System.out.println("转化为数据库格式："+sqlend_time);

        PreparedStatement ps=null;
        List<Car> p = new ArrayList<>();
        try {
            String sql="select *  from car where carName=?limit "+(page-1)*count+","+count;
            ps=getPre(sql);
            ps.setString(1,carname);

            System.out.println("sql："+ps);

            ResultSet rs =ps.executeQuery();
            while (rs.next()) {
                Car b = new Car();
                b.setCarID(rs.getInt("carId"));
                b.setCarName(rs.getString("carName"));
                b.setCarImg(rs.getString("carImg"));
                b.setCarPrice(rs.getInt("carPrice"));
                b.setCarIntroduction(rs.getString("carIntroduction"));
                p.add(b);
                System.out.println(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }


    @Override
    public Car getPlaceInfo(int id) {
        PreparedStatement ps = null;
        String sql = "select *  from car where carId=?";
        ps = getPre(sql);
        Car b = null;
        try {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Car();
                b.setCarID(rs.getInt("carId"));
                b.setCarName(rs.getString("carName"));
                b.setCarImg(rs.getString("carImg"));
                b.setCarPrice(rs.getInt("carPrice"));
                b.setCarIntroduction(rs.getString("carIntroduction"));
                System.out.println(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }
    @Override
    public boolean addcarorder(Car car,int userId) {

        String scenery=car.getCarID()+"";

        PreparedStatement ps = null;
        String sql = "update orderInfo SET car=? WHERE  userId=? and ordStatus='0'";
        ps = getPre(sql);
        int  rs=0;
        boolean result=false;
        try {
            ps.setString(1,scenery);
            ps.setInt(2,userId);
            //System.out.println("sql："+ps);
            rs =ps.executeUpdate();
            // System.out.println(rs+"--sjk");
            if (rs>0){
                result=true;
                //System.out.println(result+"--sjk");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int getAllCountofCar() {
        int result = 0;
        ResultSet rs = null;
        try {
            rs = getSta().executeQuery("select count(carID) from car");
            rs.next();
            result = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}