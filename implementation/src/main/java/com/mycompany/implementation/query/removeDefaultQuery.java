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
public class removeDefaultQuery extends Query{
    public removeDefaultQuery(){
        super();
    }
    public void payJobs(String custID){
                try {    
                                PreparedStatement s;
            String query = "UPDATE defaultcustomer SET paid = 1 WHERE defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID ='"+custID+"';";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate(query);

        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
