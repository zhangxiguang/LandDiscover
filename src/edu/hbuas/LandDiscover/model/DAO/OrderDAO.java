package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Account;
import edu.hbuas.LandDiscover.model.javaBean.Order;

public interface OrderDAO {
    public Boolean addScenery(Account account,Order order);
    public Boolean addHotel(Account account,Order order);
    public Boolean addCar(Account account,Order order);
    public Order allOrderInfo(Account account);
}
