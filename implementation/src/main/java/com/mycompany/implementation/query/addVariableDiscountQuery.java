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
public class addVariableDiscountQuery extends Query{
    public addVariableDiscountQuery(){
        super();
    }
    
    
    public void doAddVariableDiscount(String amount,String discount, String task){
                PreparedStatement s;
        try {
            String query = "INSERT INTO variablediscount (DiscountdiscountID,amount,basetask_baseTaskID) VALUES('"+discount+"','"+amount+"','"+task+"');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }
}
