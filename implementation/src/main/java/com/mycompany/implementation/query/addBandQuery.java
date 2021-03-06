/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class addBandQuery extends Query {

    public addBandQuery() {
        super();
    }

    public void addDiscount(String id) {  
//adds a discount ID into flexible discount 
        //( aka setting up the flexible discount) other fields in db are auto set to 0
        PreparedStatement s;
        try {
            String query = "INSERT INTO flexiblediscount (DiscountdiscountID) VALUES ('"+id+"');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addBand(String low, String high, String flexID, String discount) { 
//create a band with the given flexible discounts and information provided
        PreparedStatement s;
        try {
            String query = "INSERT INTO band (lowerBound,upperBound,discount,flexiblediscount_DiscountdiscountID) "
                    + "VALUES ('"+low+"','"+high+"','"+discount+"','"+flexID+"');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
