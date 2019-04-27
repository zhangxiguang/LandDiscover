package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Car;
import edu.hbuas.LandDiscover.model.javaBean.Hotel;

import java.util.List;

public interface HotelDAO {
    public List<Hotel> listhotelByPage(int page, int count);
    public List<Hotel> searchByKeywords(String hotelname, String hotelsite, String hoteldatefrom, String hoteldateto);
    public Hotel searchByHotelId(String hotelid);
    public List<Hotel> relatedHotel(int hotelprice);
    public  int getAllCountofHotel();
    public boolean addhotelorder(Hotel hotel, int useId);
}
