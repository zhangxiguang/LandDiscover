package edu.hbuas.LandDiscover.model.DAO;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class BaseDAOimp implements BaseDAO {
    private Connection con = null;
    private PreparedStatement pre;
    private Statement sta;

    private static Properties properties;
    private static DataSource dataSource;

    public BaseDAOimp() {
        FileInputStream is = null;
        properties=new Properties();
        try {
            is = new FileInputStream("src/edu/hbuas/LandDiscover/resource/dbcp.properties");
            try {
                properties.load(is);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            dataSource = new BasicDataSourceFactory().createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getCon() {

        try {
            con=(Connection)dataSource.getConnection();
            System.out.println("一个数据库连上了");
            return con;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    public PreparedStatement getPre(String sqls) {
        String sql = sqls;

        if (con == null) {
            getCon();
        }

        try {
            pre = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pre;
    }

    public Statement getSta(String sqls) {
        String sql = sqls;

        if (con == null) {
            getCon();
        }

        try {
            sta = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sta;
    }


}
