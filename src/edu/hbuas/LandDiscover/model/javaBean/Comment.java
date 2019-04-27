package edu.hbuas.LandDiscover.model.javaBean;

public class Comment {
    private String cName;
    private String cTime;
    private String cText;
    private int cId;
    private Account user;
    private  Blog blog;

    @Override
    public String toString() {
        return "Comment{" +
                "cName='" + cName + '\'' +
                ", cTime='" + cTime + '\'' +
                ", cText='" + cText + '\'' +
                ", cId=" + cId +
                ", user=" + user +
                ", blog=" + blog +
                '}';
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }

    public String getcText() {
        return cText;
    }

    public void setcText(String cText) {
        this.cText = cText;
    }

}
