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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class setDiscountQuery extends Query{
    public setDiscountQuery(){
        super();
    }
    
    public int createNewDiscount(String type,String custid){
        try {
            //create new discount
            String query = "INSERT INTO discount (discount.discountType) VALUES ('"+type+"') ";
            PreparedStatement s = this.getC().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            s.executeUpdate();
            ResultSet key = s.getGeneratedKeys();
            key.next();
            int newDiscount = key.getInt(1);
            
            //attach discount to customer
            String secondQuery= "UPDATE valuedcustomer SET valuedcustomer.DiscountdiscountID ='"+newDiscount+"' WHERE valuedcustomer.CustomercustomerID='"+custid+"'";
            PreparedStatement c = this.getC().prepareStatement(secondQuery);
            c.executeUpdate();
            
            return newDiscount;
        } catch (SQLException ex) {
            Logger.getLogger(setDiscountQuery.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
        public void removeDiscount(String custid){
        try {
            //create new discount
            String query = "UPDATE valuedcustomer set valuedcustomer.DiscountdiscountID = NULL WHERE valuedcustomer.CustomercustomerID='"+custid+"';";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
            

        } catch (SQLException ex) {
            Logger.getLogger(setDiscountQuery.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
    
}
