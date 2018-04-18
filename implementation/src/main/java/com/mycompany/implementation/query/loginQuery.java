/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    public ResultSet doLoginQuery(String user, String pass){
       
        
        try {
            String[] theuser = user.split("\\."); 
            if (theuser.length >= 1){
                String query = "SELECT * FROM staff WHERE staff.firstName = '" + theuser[0] + "' AND staff.surName = '" +theuser[1] +"' AND staff.password = '"+ pass + "';" ;
                System.out.println(query);
                PreparedStatement s = this.getC().prepareStatement(query); //create statement 
                this.r = s.executeQuery(); //execute statement
                return r;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
