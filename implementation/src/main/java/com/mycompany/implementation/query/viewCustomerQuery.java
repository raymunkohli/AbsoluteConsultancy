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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class viewCustomerQuery extends Query{
        public viewCustomerQuery(){
        super();
    }
        
        
       public ResultSet selectAllCustomers(){
          
        try {
            String query = "SELECT customer.customerID, customer.name, customer.surname,"
                    + " customer.phoneNo, customer.email, customer.address, customer.postcode,customer.holder,\n" +
                        "fixeddiscount.percentDiscount, band.discount,discount.discountType\n" +
                        "FROM customer\n" +
                        "LEFT JOIN valuedcustomer ON valuedcustomer.CustomercustomerID = customer.customerID\n" +
                        "LEFT JOIN discount ON discount.discountID = valuedcustomer.DiscountdiscountID\n" +
                        "LEFT JOIN fixeddiscount ON discount.discountID = fixeddiscount.DiscountdiscountID\n" +
                        "LEFT JOIN flexiblediscount ON discount.discountID = flexiblediscount.DiscountdiscountID\n" +
                        "LEFT JOIN band ON flexiblediscount.bandBandID = band.BandID "
                    + "ORDER BY customer.customerID ASC";
            System.out.println(query);

            PreparedStatement s = this.getC().prepareStatement(query);
            
            
            return s.executeQuery();
            
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
       }
       
       public ResultSet selectPaymentCust(){
           try{
               String query ="SELECT distinct customer.customerID,customer.name,customer.surname,customer.address,customer.phoneNo,customer.postcode,customer.holder\n" +
                "FROM customer\n" +
                "INNER JOIN job on job.CustomercustomerID = customer.customerID\n" +
                "LEFT JOIN payment ON job.JobID = payment.JobJobID WHERE payment.JobJobID IS NULL;";
               System.out.println(query);
                 PreparedStatement s = this.getC().prepareStatement(query);
                 return s.executeQuery();
                 
           } catch (SQLException ex) {
                Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }

       }
}
