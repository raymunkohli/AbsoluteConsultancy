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
    public void doAddPayment(int JobID,LocalDate date){
        try {
            PreparedStatement s;
            String query = "INSERT INTO payment (payment.JobJobID,payment.paymentDate) VALUES ('"+JobID+"','"+date+"');";
            s = this.getC().prepareStatement(query);           
            s.executeUpdate(query);

        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public  void addCardPayment(int jobid, String cardNo, String expDate, String Type){
        try {
            PreparedStatement s;
            String query = "INSERT INTO cardpayment (cardpayment.PaymentJobJobID, cardpayment.cardNo, cardpayment.expDate, cardpayment.type)"
                    + " values ('"+jobid+"','"+cardNo+"','"+expDate+"','"+Type+"');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate(query);
            
        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
        
    }
}
