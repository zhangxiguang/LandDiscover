package edu.hbuas.LandDiscover.model.javaBean;


public class Blog {

  private int blogId;
  private String blogtitle;
  private String blogtext;
  private String blogimg;
  private String blogtag;
  private Account user;
  private String blogtime;
  private int commentnum;

  @Override
  public String toString() {
    return "Blog{" +
            "blogId=" + blogId +
            ", blogtitle='" + blogtitle + '\'' +
            ", blogtext='" + blogtext + '\'' +
            ", blogimg='" + blogimg + '\'' +
            ", blogtag='" + blogtag + '\'' +
            ", user=" + user +
            ", blogtime='" + blogtime + '\'' +
            ", commentnum=" + commentnum +
            '}';
  }

  public int getCommentnum() {
    return commentnum;
  }

  public void setCommentnum(int commentnum) {
    this.commentnum = commentnum;
  }

  public String getBlogtime() {
    return blogtime;
  }

  public void setBlogtime(String blogtime) {
    this.blogtime = blogtime;
  }

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


  public Account getUser() {
    return user;
  }

  public void setUser(Account user) {
    this.user = user;
  }

}
