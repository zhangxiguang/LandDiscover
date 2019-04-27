package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Car;

import java.util.Date;
import java.util.List;

public interface CarDAO {
    public List<Car> listcarByPage(int page, int count);
    public  int getAllCountofCar();
    public int getSearchCount(String carname);
    public List<Car> search(String carname, int page, int count);
    public  Car  getCarDetailByName(String carName);
    public boolean addcarorder(Car car, int userId);
    public Car getPlaceInfo(int id);


}
