package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Account;

import javax.jws.soap.SOAPBinding;

public interface AccountDAO {
    public Account login(String username, String password);

    Account login(String username);

    public boolean register(Account account);
    public boolean checkUser(String username);
    public boolean changeInformation(Account account);
    public boolean changePassword(Account account, String password);
}
