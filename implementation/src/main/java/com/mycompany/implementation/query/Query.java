/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class Query {
    private Connection c;

    public Connection getC() {
        return c;
    }
    
    public Query(){
        String url = "jdbc:mysql://localhost:3306/sys?zeroDateTimeBehavior=convertToNull&useSSL=false"; //db location
        try {
            Class.forName("com.mysql.jdbc.Driver"); //make instance of driver
            this.c = DriverManager.getConnection(url,"root","1234"); //connect to db
                        
        } 
        
          catch (ClassNotFoundException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
