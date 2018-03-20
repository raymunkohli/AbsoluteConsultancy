/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class addCustomerQuery {
        private Connection c;
    private ResultSet r;
    
    public addCustomerQuery(String dbname, String user, String pass){
        String url = "jdbc:mysql://localhost:3306/sys?zeroDateTimeBehavior=convertToNull"; //db location
        try {
            Class.forName("com.mysql.jdbc.Driver"); //make instance of driver
            this.c = DriverManager.getConnection(url,user,pass); //connect to db
                        
        } 
        
          catch (ClassNotFoundException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void doAddCustomerQuery(Customer c){
        PreparedStatement s;
            try {
                String query = "INSERT INTO customer (name,surname,phoneNo,email,address,postcode) VALUES('"
                + c.getName() +"','" +c.getSurname() + "','" + c.getPhoneNo() + "','" + c.getEmail() +"','"
                + c.getAddress() +"','"+c.getPostcode() +"');";
                System.out.println(query);
                s = this.c.prepareStatement(query);
                s.execute();
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
       
    }


}
