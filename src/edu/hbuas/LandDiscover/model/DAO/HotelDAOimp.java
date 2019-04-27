package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Car;
import edu.hbuas.LandDiscover.model.javaBean.Hotel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public  class HotelDAOimp extends BaseDAOimp implements HotelDAO {

    ResultSet rs=null;
    @Override
    public List<Hotel> listhotelByPage(int page, int count) {
        List<Hotel> hl=new ArrayList<>();
        try {
            //limit "+(page-1)*count+","+count
            ResultSet rs=getSta().executeQuery("select * from hotel limit "+(page-1)*count+","+count);
            while(rs.next()){
                Hotel h=new Hotel();
                h.setHotelid(rs.getString("hotelid"));
                h.setHotelsite(rs.getString("hotelsite"));
                h.setHotelname(rs.getString("hotelname"));
                h.setHotelimg(rs.getString("hotelimg"));
                h.setHotelrating(rs.getInt("hotelrating"));
                h.setHotelintroduction(rs.getString("hotelintroduction"));
                h.setHotelprice(rs.getString("hotelprice"));
                hl.add(h);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hl;
    }

    @Override
    public List<Hotel> searchByKeywords(String hotelname,String hotelsite,String hoteldatefrom,String hoteldateto) {
        List<Hotel> hotel=new ArrayList<>();

        try {

            String sql="select * from hotel where hotelname ='"+hotelname+ "' and  hotelsite ='"+hotelsite+"' and  hoteldatefrom ='"+hoteldatefrom+"' and  hoteldateto ='"+hoteldateto+"'";

            rs=getSta().executeQuery(sql);
            while(rs.next())
            {
                Hotel h=new Hotel();
                h.setHotelid(rs.getString("hotelid"));
                h.setHotelsite(rs.getString("hotelsite"));
                h.setHotelname(rs.getString("hotelname"));
                h.setHotelimg(rs.getString("hotelimg"));
                h.setHotelrating(rs.getInt("hotelrating"));
                h.setHotelintroduction(rs.getString("hotelintroduction"));
                h.setHotelprice(rs.getString("hotelprice"));
                hotel.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hotel;
    }

    @Override
    public boolean addhotelorder(Hotel hotel, int userId) {

        String hotelq=hotel.getHotelid()+"";

        PreparedStatement ps = null;
        String sql = "update orderInfo SET hotel=? WHERE  userId=? and ordStatus='0'";
        ps = getPre(sql);
        int  rs=0;
        boolean result=false;
        try {
            ps.setString(1,hotelq);
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


    /**
     * 这是查询酒店详情的方法
     * 参数：酒店id,将查询到的结果封装到Hotel对象。
     * @return 查询结果是一个Hotel，而不是一个结果集
     */
    @Override
    public Hotel searchByHotelId(String hotelid){
        Hotel hotel=new Hotel();
        try {
            ResultSet rs=getSta().executeQuery("select * from hotel where hotelid="+hotelid);
            System.out.println("select * from hotel where hotelid="+hotelid);
            while(rs.next())
            {
                hotel.setHotelid(rs.getString("hotelid"));
                hotel.setHotelimg(rs.getString("hotelimg"));
                hotel.setHotelname(rs.getString("hotelname"));
                hotel.setHotelprice(rs.getString("hotelprice"));
                hotel.setHotelintroduction(rs.getString("hotelintroduction"));
                hotel.setHotelrating(rs.getInt("hotelrating"));
                hotel.setHotelsite(rs.getString("hotelsite"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }

    @Override
    public List<Hotel> relatedHotel(int hotelprice) {
        List<Hotel> listhotel=new ArrayList<>();
        Hotel hotel=new Hotel();
        try {
            ResultSet rs=getSta().executeQuery("select * from hotel where hotelprice="+hotelprice);
            System.out.println("select * from hotel where hotelprice="+hotelprice);
            System.out.println(rs);
            while(rs.next())
            {
                hotel.setHotelid(rs.getString("hotelid"));
                hotel.setHotelimg(rs.getString("hotelimg"));
                hotel.setHotelname(rs.getString("hotelname"));
                hotel.setHotelprice(rs.getString("hotelprice"));
                hotel.setHotelintroduction(rs.getString("hotelintroduction"));
                hotel.setHotelrating(rs.getInt("hotelrating"));
                hotel.setHotelsite(rs.getString("hotelsite"));
                listhotel.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listhotel;
    }


    @Override
    public int getAllCountofHotel() {
        int result = 0;
        ResultSet rs = null;
        try {
            rs = getSta().executeQuery("select count(hotelid) from hotel");
            rs.next();
            result = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}