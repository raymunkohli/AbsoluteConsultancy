/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class addPaymentQuery extends Query {

    public addPaymentQuery() {
        super();
    }

    public void doAddPayment(int JobID, LocalDate date) {
        try {
            PreparedStatement s;
            String query = "INSERT INTO payment (payment.JobJobID,payment.paymentDate) VALUES ('" + JobID + "','" + date + "');";
            s = this.getC().prepareStatement(query);
            s.executeUpdate(query);

        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addCardPayment(int jobid, String cardNo, String expDate, String Type) {
        try {
            PreparedStatement s;
            String query = "INSERT INTO cardpayment (cardpayment.PaymentJobJobID, cardpayment.cardNo, cardpayment.expDate, cardpayment.type)"
                    + " values ('" + jobid + "','" + cardNo + "','" + expDate + "','" + Type + "');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate(query);

        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    public List<Double> checkForFlexDiscount(int JobID) {
        try {
            PreparedStatement s;
            List<Double> valueDiscount = new ArrayList();
            String query = "SELECT discount.discountID, flexiblediscount.aquiredValue\n"
                    + "FROM discount\n"
                    + "RIGHT JOIN flexiblediscount ON discount.discountID = flexiblediscount.DiscountdiscountID\n"
                    + "INNER JOIN valuedcustomer ON valuedcustomer.DiscountdiscountID = discountID\n"
                    + "INNER JOIN job ON job.CustomercustomerID = valuedcustomer.CustomercustomerID\n"
                    + "WHERE job.JobID='" + JobID + "' ";
            s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            if (a.next()) {

                valueDiscount.add(a.getDouble("discountID"));
                valueDiscount.add(a.getDouble("aquiredValue"));
                return valueDiscount;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(addPaymentQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;

        }
    }

    public void upgradeBand(int discountID, double value) {
        PreparedStatement s;
        try {
            String query = "UPDATE flexiblediscount \n"
                    + "SET "
                    + "flexiblediscount.aquiredValue ='" + value + "' "
                    + "WHERE flexiblediscount.DiscountdiscountID ='" + discountID + "';";
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void removeSuspended(String custID) {
        PreparedStatement s;
        try {
            String query = "DELETE FROM suspendedcustomer WHERE suspendedcustomer.ValuedCustomerCustomercustomerID = (SELECT job.CustomercustomerID from job where job.JobID ='"+custID+"');";
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
        public void removeDefault(String custID) {
        PreparedStatement s;
        try {
            String query = "DELETE FROM defaultcustomer WHERE defaultcustomer.suspendedcustomerValuedCustomerCustomercustomerID = (SELECT job.CustomercustomerID from job where job.JobID ='"+custID+"');";
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
