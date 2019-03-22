package edu.hbuas.LandDiscover.control;


public class Order {

  private long orderId;
  private long userId;
  private String fromId;
  private String toId;
  private String scenery;
  private String hotel;
  private String car;
  private long time;
  private String startDate;
  private String endDate;
  private long humans;
  private double money;


  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
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


  public long getTime() {
    return time;
  }

  public void setTime(long time) {
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


  public long getHumans() {
    return humans;
  }

  public void setHumans(long humans) {
    this.humans = humans;
  }


  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }

}
