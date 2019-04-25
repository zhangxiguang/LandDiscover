package edu.hbuas.LandDiscover.model.javaBean;


public class Order {

  private int orderId;
  private int userId;
  private String fromId;
  private String toId;
  private String scenery;
  private String hotel;
  private String car;
  private String time;
  private String startDate;
  private String endDate;
  private int humans;
  private double money;
  private String status;



  public Order() {
  }


  public Order(int orderId, int userId, String fromId, String toId, String scenery, String hotel, String car, String time, String startDate, String endDate, int humans, double money, String status) {
    this.orderId = orderId;
    this.userId = userId;
    this.fromId = fromId;
    this.toId = toId;
    this.scenery = scenery;
    this.hotel = hotel;
    this.car = car;
    this.time = time;
    this.startDate = startDate;
    this.endDate = endDate;
    this.humans = humans;
    this.money = money;
    this.status = status;
  }

  public Order(String scenery) {
    this.scenery = scenery;
  }


  public int getOrderId() {
    return orderId;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }


  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }


  public String getFromId() {
    return fromId;
  }

  public void setFromId(String fromId) {
    this.fromId = fromId;
  }


  public String getToId() {
    return toId;
  }

  public void setToId(String toId) {
    this.toId = toId;
  }


  public String getScenery() {
    return scenery;
  }

  public void setScenery(String scenery) {
    this.scenery = scenery;
  }


  public String getHotel() {
    return hotel;
  }

  public void setHotel(String hotel) {
    this.hotel = hotel;
  }


  public String getCar() {
    return car;
  }

  public void setCar(String car) {
    this.car = car;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }


  public String getStartDate() {
    return startDate;
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }


  public String getEndDate() {
    return endDate;
  }

  public void setEndDate(String endDate) {
    this.endDate = endDate;
  }


  public int getHumans() {
    return humans;
  }

  public void setHumans(int humans) {
    this.humans = humans;
  }


  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

}
