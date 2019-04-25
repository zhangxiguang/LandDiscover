package edu.hbuas.LandDiscover.model.javaBean;


public class Account {

  private int userId;
  private String username;
  private String password;
  private String nickname;
  private long phone;
  private String sex;
  private String address;
  private String image;

  public Account() {
  }

  public Account(int userId, String username, String password, String nickname, long phone, String sex, String address) {
    this.userId = userId;
    this.username = username;
    this.password = password;
    this.nickname = nickname;
    this.phone = phone;
    this.sex = sex;
    this.address = address;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }


  public long getPhone() {
    return phone;
  }

  public void setPhone(long phone) {
    this.phone = phone;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }
}
