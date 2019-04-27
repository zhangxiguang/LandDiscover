package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Place;

import java.util.Date;
import java.util.List;

public interface PlaceDAO {
    public int getPlaceCount();
    public List<Place> getPlacelist(int page, int count);
    public int getSearchCount(String from, String to, Date start_time, Date end_time, String time);
    public List<Place> search(String from, String to, Date start_time, Date end_time, String time, int page, int count);
    public Place getPlaceInfo(int id);
    public boolean addplaceorder(Place place, int userId);
}
