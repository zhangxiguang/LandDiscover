package edu.hbuas.LandDiscover.model.javaBean;


public class Blog {

  private int blogId;
  private String blogtitle;
  private String blogtext;
  private String blogimg;
  private String blogtag;
  private int userid;


  public int getBlogId() {
    return blogId;
  }

  public void setBlogId(int blogId) {
    this.blogId = blogId;
  }


  public String getBlogtitle() {
    return blogtitle;
  }

  public void setBlogtitle(String blogtitle) {
    this.blogtitle = blogtitle;
  }


  public String getBlogtext() {
    return blogtext;
  }

  public void setBlogtext(String blogtext) {
    this.blogtext = blogtext;
  }


  public String getBlogimg() {
    return blogimg;
  }

  public void setBlogimg(String blogimg) {
    this.blogimg = blogimg;
  }


  public String getBlogtag() {
    return blogtag;
  }

  public void setBlogtag(String blogtag) {
    this.blogtag = blogtag;
  }


  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

}
