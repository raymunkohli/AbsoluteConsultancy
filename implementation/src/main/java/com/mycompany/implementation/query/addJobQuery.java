/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Customer;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymu
 */
public class addJobQuery extends Query {

    addJobQuery() {
        super();
    }

    public void doAddJobQuery(Customer c) {
        PreparedStatement s;
        try {
            String query = "INSERT INTO customer (name,surname,phoneNo,email,address,postcode) VALUES('"
                    + c.getName() + "','" + c.getSurname() + "','" + c.getPhoneNo() + "','" + c.getEmail() + "','"
                    + c.getAddress() + "','" + c.getPostcode() + "');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.execute();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
