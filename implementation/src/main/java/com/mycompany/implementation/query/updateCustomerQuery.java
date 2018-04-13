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
public class updateCustomerQuery extends Query{
    public updateCustomerQuery(){
        super();
    }
    
    public void doUpdateCustomerQuery(String id, String name, String surname,String phoneNo, String email,String address,String postcode,String holder){
        String Query="UPDATE customer SET "
                + "customer.name='"+name+"',customer.surname='"+surname+"',customer.phoneNo='"+phoneNo+"',"
                + "customer.email='"+email+"',customer.address='"+address+"',customer.postcode='"+postcode+"',customer.holder='"+holder+"' "
                + "WHERE customer.customerID ='"+id+"';";
                try {
            PreparedStatement s;
            System.out.println(Query);
            s = this.getC().prepareStatement(Query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
}
