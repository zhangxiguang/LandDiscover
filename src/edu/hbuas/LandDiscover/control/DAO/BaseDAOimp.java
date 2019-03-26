package edu.hbuas.LandDiscover.control.DAO;

import java.sql.*;

public class BaseDAOimp implements BaseDAO {
    private Connection con = null;
    private PreparedStatement pre;
    private Statement sta;

    public Connection getCon() {

        try {
            try {
                Class.forName(driverClass);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return con;
    }

    public PreparedStatement getPre(String sqls){
        String sql=sqls;

        if (con==null){
            getCon();
        }

        try {
            pre=con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pre;
    }

    public Statement getSta(String sqls){
        String sql=sqls;

        if (con==null){
            getCon();
        }

        try {
            sta=con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sta;
    }
}
