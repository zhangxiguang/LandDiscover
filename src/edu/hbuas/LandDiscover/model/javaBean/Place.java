package edu.hbuas.LandDiscover.model.javaBean;

public class Place {
    private int id;
    private String name;
    private String describe;
    private int grade;
    private String time;
    private float price;
    private String image;

    public Place() {
    }

    public Place(int id, String name, String describe, int grade, String time, float price, String image) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.grade = grade;
        this.time = time;
        this.price = price;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Place{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", describe='" + describe + '\'' +
                ", grade=" + grade +
                ", time='" + time + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}
