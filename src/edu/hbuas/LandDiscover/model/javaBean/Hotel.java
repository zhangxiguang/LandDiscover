package edu.hbuas.LandDiscover.model.javaBean;

public class Hotel {


    private String hotelname;
    private String hotelprice;
    private String hotelintroduction;
    private String hotelimg;
    private int hotelrating;
    private String hotelsite;

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public String getHotelprice() {
        return hotelprice;
    }

    public void setHotelprice(String hotelprice) {
        this.hotelprice = hotelprice;
    }

    public String getHotelintroduction() {
        return hotelintroduction;
    }

    public void setHotelintroduction(String hotelintroduction) {
        this.hotelintroduction = hotelintroduction;
    }

    public String getHotelimg() {
        return hotelimg;
    }

    public void setHotelimg(String hotelimg) {
        this.hotelimg = hotelimg;
    }

    public int getHotelrating() {
        return hotelrating;
    }

    public void setHotelrating(int hotelrating) {
        this.hotelrating = hotelrating;
    }

    public String getHotelsite() {
        return hotelsite;
    }

    public void setHotelsite(String hotelsite) {
        this.hotelsite = hotelsite;
    }

    public String getHotelid() {
        return hotelid;
    }

    public void setHotelid(String hotelid) {
        this.hotelid = hotelid;
    }

    private String hotelid;


    public Hotel() {
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hotelname='" + hotelname + '\'' +
                ", hotelprice='" + hotelprice + '\'' +
                ", hotelintroduction='" + hotelintroduction + '\'' +
                ", hotelimg='" + hotelimg + '\'' +
                ", hotelrating=" + hotelrating +
                ", hotelsite='" + hotelsite + '\'' +
                ", hotelid='" + hotelid + '\'' +
                '}';
    }

    public Hotel(String hotelid, String hotelname, String hotelprice, String hotelintroduction, String hotelimg, int hotelrating, String hotelsite) {
        this.hotelid = hotelid;
        this.hotelname = hotelname;
        this.hotelprice = hotelprice;
        this.hotelintroduction = hotelintroduction;
        this.hotelimg = hotelimg;
        this.hotelrating = hotelrating;
        this.hotelsite = hotelsite;
    }



}
