package com.erp.dao;

import java.sql.*;

public class DBConnection {
    
    private String url = "jdbc:mysql://localhost:3306/erp_iwt";
    private String username = "root";
    private String password = "Mz7My_SqL9009";

    public Connection con;

    public DBConnection(){
        
    }
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

}
