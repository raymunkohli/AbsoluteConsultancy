/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class loginQuery {
    private Connection c;
    private ResultSet r;
    
    public loginQuery(String dbname, String user, String pass){
        String url = "jdbc:mysql://localhost:3306/sys?zeroDateTimeBehavior=convertToNull"; //db location
        try {
            Class.forName("com.mysql.jdbc.Driver"); //make instance of driver
            this.c = DriverManager.getConnection(url,user,pass); //connect to db
            c.setSchema("new_schema");
            
        } 
        
          catch (ClassNotFoundException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String doLoginQuery(String user, String pass){
       
        
        try {
            String[] theuser = user.split("\\."); 
            if (theuser.length >1){
                String query = "SELECT * FROM staff WHERE staff.firstName = '" + theuser[0] + "' AND staff.surName = '" +theuser[1] +"' AND staff.password = "+ pass + ";" ;
                System.out.println(query);
                PreparedStatement s = this.c.prepareStatement(query); //create statement 
                this.r = s.executeQuery(); //execute statement
                r.next();
                return r.getObject("employeeType").toString(); //returns if any rows are found
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
