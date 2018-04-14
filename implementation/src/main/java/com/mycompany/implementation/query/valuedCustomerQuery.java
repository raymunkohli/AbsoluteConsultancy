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
public class valuedCustomerQuery extends Query{
    public valuedCustomerQuery(){
        super();
    }
    public void setValued(String custid){
               try {
            String query = "INSERT INTO valuedcustomer (valuedcustomer.CustomercustomerID) VALUES ('"+custid+"');";
            System.out.println(query);
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public void removeValued(String custid){
               try {
            String query = "DELETE FROM valuedcustomer WHERE valuedcustomer.CustomercustomerID ='"+custid+"';";
            System.out.println(query);
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
