package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Place;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class PlaceDAOimp extends BaseDAOimp implements PlaceDAO {


    @Override
    public int getPlaceCount() {
        int result=0;
        ResultSet rs=null;
        try {
            rs=getSta().executeQuery("select count(id) from places");
            rs.next();
            result=rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(result);
        return result;
    }

    @Override
    public List<Place> getPlacelist(int page, int count) {
        List<Place> p = new ArrayList<>();
        try {
            ResultSet rs = getSta().executeQuery("select *  from places limit "+(page-1)*count+","+count);
            while (rs.next()) {
                Place b = new Place();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setDescribe(rs.getString("describe"));
                b.setGrade(rs.getInt("grade"));
                b.setImage(rs.getString("image"));
                b.setPrice(rs.getInt("price"));
                b.setFrom(rs.getString("from"));
                b.setTo(rs.getString("to"));
                b.setStart_time(rs.getDate("start_time"));
                b.setEnd_time(rs.getDate("end_time"));
                b.setTime(rs.getString("time"));
                p.add(b);
                System.out.println(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public int getSearchCount(String from, String to, Date start_time, Date end_time, String time) {
        java.sql.Date sqlend_time=null;
        java.sql.Date sqlstart_time=null;
        if(end_time!=null){
            sqlend_time=new java.sql.Date(end_time.getTime());
        }
        if(start_time!=null){
           sqlstart_time=new java.sql.Date(start_time.getTime());
        }


        int result=0;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try {
            String sql="select count(id)  from places where `from`=? or `to`=? or start_time=? or end_time=? or time=?";
            ps=getPre(sql);
            ps.setString(1,from);
            ps.setString(2,to);
            ps.setDate(3, sqlstart_time);
            ps.setDate(4, sqlend_time);
            ps.setString(5,time);
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
    public List<Place> search(String from, String to, Date start_time, Date end_time, String time,int page,int count) {

        java.sql.Date sqlend_time=null;
        java.sql.Date sqlstart_time=null;
        if(end_time!=null){
            sqlend_time=new java.sql.Date(end_time.getTime());
        }
        if(start_time!=null){
            sqlstart_time=new java.sql.Date(start_time.getTime());
        }

//        System.out.println("转化为数据库格式："+sqlstart_time);
//        System.out.println("转化为数据库格式："+sqlend_time);

        PreparedStatement ps=null;
        List<Place> p = new ArrayList<>();
        try {
            String sql="select *  from places where `from`=? or `to`=? or start_time=? or end_time=? or time=? limit "+(page-1)*count+","+count;
            ps=getPre(sql);
            ps.setString(1,from);
            ps.setString(2,to);
            ps.setDate(3, sqlstart_time);
            ps.setDate(4, sqlend_time);
            ps.setString(5,time);
            System.out.println("sql："+ps);

            ResultSet rs =ps.executeQuery();
            while (rs.next()) {
                Place b = new Place();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setDescribe(rs.getString("describe"));
                b.setGrade(rs.getInt("grade"));
                b.setImage(rs.getString("image"));
                b.setPrice(rs.getInt("price"));
                b.setFrom(rs.getString("from"));
                b.setTo(rs.getString("to"));
                b.setStart_time(rs.getDate("start_time"));
                b.setEnd_time(rs.getDate("end_time"));
                b.setTime(rs.getString("time"));
                p.add(b);
                System.out.println(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public Place getPlaceInfo(int id) {
        PreparedStatement ps = null;
        String sql = "select *  from places where id=?";
        ps = getPre(sql);
        Place b = null;
        try {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Place();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setDescribe(rs.getString("describe"));
                b.setGrade(rs.getInt("grade"));
                b.setImage(rs.getString("image"));
                b.setPrice(rs.getInt("price"));
                b.setFrom(rs.getString("from"));
                b.setTo(rs.getString("to"));
                b.setStart_time(rs.getDate("start_time"));
                b.setEnd_time(rs.getDate("end_time"));
                b.setTime(rs.getString("time"));
                System.out.println(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }

    @Override
        public boolean addplaceorder(Place place,int userId) {
        String fromId=place.getFrom();
        String toId=place.getTo();
        Date startTime=place.getStart_time();
        Date endTime = place.getEnd_time();
        String time=place.getTime();
        String scenery=place.getId()+"";


        java.sql.Date sqlend_time=new java.sql.Date(endTime.getTime());
        java.sql.Date sqlstart_time=new java.sql.Date(startTime.getTime());

        PreparedStatement ps = null;
        String sql = "insert into orderinfo(userId,fromId,toId,startTime,endTime,time,scenery,ordStatus) values(?,?,?,?,?,?,?,?)";
        ps = getPre(sql);
        int  rs=0;
        boolean result=false;
        try {
            ps.setInt(1,userId);
            ps.setString(2,fromId);
            ps.setString(3,toId);
            ps.setDate(4, sqlstart_time);
            ps.setDate(5, sqlend_time);
            ps.setString(6,time);
            ps.setString(7,scenery);
            ps.setString(8,"0");
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
}