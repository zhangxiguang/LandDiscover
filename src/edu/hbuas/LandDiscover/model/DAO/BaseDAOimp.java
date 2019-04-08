package edu.hbuas.LandDiscover.model.DAO;


import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;


public class BaseDAOimp implements BaseDAO {
    private static Connection con=null;
    private PreparedStatement pre;
    private Statement sta;

    private static Properties properties;
    private static DataSource dataSource;
    private static BasicDataSourceFactory dataSourceFactory;

   static {
//        properties = new Properties();
//        try {
//            properties.load(new FileInputStream("resource/dbcp.properties"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        System.out.println(properties.size());
//        dataSourceFactory = new BasicDataSourceFactory();//链接池工厂
//        try {
//            dataSource = dataSourceFactory.createDataSource(properties);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("initial datasource," + dataSource);

       try {
           Class.forName(driverClass); //classLoader,加载对应驱动
           try {
               con = (Connection) DriverManager.getConnection(url, username, password);
           } catch (SQLException e) {
               e.printStackTrace();
           }
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }

    }

    public Connection getCon() {
//        try {
//            con=dataSource.getConnection();
//            con.setAutoCommit(false);
//            System.out.println(con);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return null;
//        }
        System.out.println("一个数据库已连接");
        return  con;
    }


    public PreparedStatement getPre(String sqls) {
        String sql = sqls;

        if (con == null) {
            getCon();
        }

        try {
            pre = con.prepareStatement(sql);
            return pre;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pre;
    }

    public Statement getSta() {

        if (con == null) {
            getCon();
        }

        try {
            sta = con.createStatement();
            return sta;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sta;
    }


}
