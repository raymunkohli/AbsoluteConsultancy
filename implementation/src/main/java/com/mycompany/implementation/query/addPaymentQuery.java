/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class addPaymentQuery extends Query{
    public addPaymentQuery(){
        super();
    }
    public int doAddPayment(int JobID,LocalDate date){
        try {
            PreparedStatement s;
            String query = "INSERT INTO payment (payment.JobJobID,payment.paymentDate) VALUES ('"+JobID+"','"+date+"');";
            s = this.getC().prepareStatement(query);
            System.out.println(query);
            int rows = s.executeUpdate();
            ResultSet jobidset = s.getGeneratedKeys();
            int paymentid =jobidset.getInt(1);
            return paymentid;
            
        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public void addCardPayment(){
        
    }
}
