/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class searchForCustQuery extends Query {

    public searchForCustQuery() {
        super();
    }

    public ResultSet doSearchForCustQuery(String Query) {
        try {
            PreparedStatement s;
            List<Customer> AllCust = new ArrayList();
            String query = "SELECT customer.customerID, customer.name, customer.surname,"
                    + " customer.phoneNo, customer.email, customer.address, customer.postcode,customer.holder,\n"
                    + "fixeddiscount.percentDiscount, band.discount,discount.discountType\n"
                    + "FROM customer\n"
                    + "LEFT JOIN valuedcustomer ON valuedcustomer.CustomercustomerID = customer.customerID\n"
                    + "LEFT JOIN discount ON discount.discountID = valuedcustomer.DiscountdiscountID\n"
                    + "LEFT JOIN fixeddiscount ON discount.discountID = fixeddiscount.DiscountdiscountID\n"
                    + "LEFT JOIN band ON flexiblediscount.DiscountdiscountID = band.flexiblediscount_DiscountdiscountID \n" +
                        "AND band.BandID = (SELECT band.BandID from band WHERE band.lowerBound<= flexiblediscount.aquiredValue AND band.upperBound >= flexiblediscount.aquiredValue) "
                    + "WHERE "+Query+" "
                    + "ORDER BY customer.customerID ASC";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet cust = s.executeQuery();
            return cust;
        } catch (SQLException ex) {
            Logger.getLogger(searchForCustQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
