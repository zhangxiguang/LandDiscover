package edu.hbuas.LandDiscover.model.DAO;

import edu.hbuas.LandDiscover.model.javaBean.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAOimp  extends BaseDAOimp implements  AccountDAO{
    @Override
    public Account login(String username, String password) {
        String loginSQL="select *  from  account where username=? and password=?";
        Account u=null;
        try {
            PreparedStatement pre=getPre(loginSQL);
            pre.setString(1,username);
            pre.setString(2,password);
            ResultSet rs= pre.executeQuery();
            if(rs.next()) {
                u=new Account();
                u.setUserId(rs.getInt("userId"));
                u.setUsername(rs.getString("username"));
                u.setNickname(rs.getString("nickname"));
                u.setPhone(rs.getString("phone"));
                u.setSex(rs.getString("sex"));
                u.setAddress(rs.getString("address"));
                u.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public Account login(String username) {
        String loginSQL="select *  from account where username=?";
        Account u=null;
        try {
            PreparedStatement pre=getPre(loginSQL);
            pre.setString(1,username);
            ResultSet rs= pre.executeQuery();
            if(rs.next()) {
                u=new Account();
                u.setUserId(rs.getInt("userId"));
                u.setUsername(rs.getString("username"));
                u.setNickname(rs.getString("nickname"));
                u.setPhone(rs.getString("phone"));
                u.setSex(rs.getString("sex"));
                u.setAddress(rs.getString("address"));
                u.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    //注册
    @Override
    public boolean register(Account account) {
        String loginSQL="insert into account(userId,username,password,nickname,phone,sex,address,image) values(?,?,?,?,?,?,?,?)";
        boolean result=false;
        try {
            PreparedStatement pre=getPre(loginSQL);
            pre.setInt(1,account.getUserId());
            pre.setString(2,account.getUsername());
            pre.setString(3,account.getPassword());
            pre.setString(4,account.getNickname());
            pre.setString(5,account.getPhone());
            pre.setString(6,account.getSex());
            pre.setString(7,account.getAddress());
            pre.setString(8,account.getImage());
            result=pre.executeUpdate()>0?true:false;

        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result){
            System.out.println("注册成功");
        }
        return result;
    }

    @Override
    public boolean checkUser(String username) {
        String sql="select 1 from  account where username=?";
        boolean result=false;
        ResultSet rs=null;
        try {
            PreparedStatement pre=getPre(sql);
            pre.setString(1,username);
            rs=pre.executeQuery();
            result=rs.next()?false:true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean changeInformation (Account account) {
        String sql = "update account set  nickname=?,phone=?, sex=?, address=?, image=? where account.userId="+account.getUserId();
        boolean result = false;
        PreparedStatement pre = getPre(sql);
        try {
            pre.setString(1,account.getNickname());
            pre.setString(2,account.getPhone());
            pre.setString(3,account.getSex());
            pre.setString(4,account.getAddress());
            pre.setString(5,account.getImage());
            result=pre.executeUpdate()>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean changePassword (Account account,String password){
        String sql = "update account set password=? where account.userId="+account.getUserId()+" and account.password=" +password;
        boolean result = false;
        PreparedStatement pre = getPre(sql);
        try {
            pre.setString(1,account.getPassword());
            result = pre.executeUpdate()>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
