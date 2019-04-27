package edu.hbuas.LandDiscover.model.javaBean;

public class Car {

    private int carID;
    private String carName;
    private String carImg;
    private String carIntroduction;
    private int carPrice;


    public Car() {
    }

    public Car(int carID, String carName, String carImg, String carIntroduction, int carPrice) {
        this.carID = carID;
        this.carName = carName;
        this.carImg = carImg;
        this.carIntroduction = carIntroduction;
        this.carPrice = carPrice;
    }

    @Override
    public String toString() {
        return "Car{" +
                "carID=" + carID +
                ", carName='" + carName + '\'' +
                ", carImg='" + carImg + '\'' +
                ", carIntroduction='" + carIntroduction + '\'' +
                ", carPrice=" + carPrice +
                '}';
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getCarImg() {
        return carImg;
    }

    public void setCarImg(String carImg) {
        this.carImg = carImg;
    }

    public String getCarIntroduction() {
        return carIntroduction;
    }

    public void setCarIntroduction(String carIntroduction) {
        this.carIntroduction = carIntroduction;
    }

    public int getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(int carPrice) {
        this.carPrice = carPrice;
    }

}
