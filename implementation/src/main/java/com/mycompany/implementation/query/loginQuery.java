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
public class loginQuery extends Query{
    private ResultSet r;
    
    public loginQuery(){
        super();
    }
    
    public String doLoginQuery(String user, String pass){
       
        
        try {
            String[] theuser = user.split("\\."); 
            if (theuser.length >1){
                String query = "SELECT * FROM staff WHERE staff.firstName = '" + theuser[0] + "' AND staff.surName = '" +theuser[1] +"' AND staff.password = "+ pass + ";" ;
                PreparedStatement s = this.getC().prepareStatement(query); //create statement 
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
