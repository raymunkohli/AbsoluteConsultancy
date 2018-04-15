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
public class getPaymentGivenCustomer extends Query{

    public getPaymentGivenCustomer() {
        super();
    }
    public ResultSet doGetPaymentGivenCustomer(int custid){
                PreparedStatement s;
            try {
                String query = "SELECT job.JobID, job.value, job.orderDate,job.deadline,job.number \n" +
"                                FROM Job\n" +
"                                INNER JOIN customer ON customer.customerID = job.CustomercustomerID\n" +
"                                LEFT JOIN payment ON job.JobID = payment.JobJobID\n" +
"                                WHERE customer.customerID ='"+custid+"' AND payment.JobJobID IS NULL AND job.finished=1;";
                
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet b =s.executeQuery();
                return b;
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
       
    }
    
    
}
