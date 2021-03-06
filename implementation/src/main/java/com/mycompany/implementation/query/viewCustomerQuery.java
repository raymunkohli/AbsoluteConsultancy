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
public class viewCustomerQuery extends Query {

    public viewCustomerQuery() {
        super();
    }

    public ResultSet selectAllCustomers() {

        try {
            String query = "   SELECT customer.customerID, customer.name, customer.surname,\n"
                    + "                     customer.phoneNo, customer.email, customer.address, customer.postcode,customer.holder,\n"
                    + "                    fixeddiscount.percentDiscount, band.discount,discount.discountType,flexiblediscount.aquiredValue,valuedcustomer.CustomercustomerID \n"
                    + "                    FROM customer\n"
                    + "                    LEFT JOIN valuedcustomer ON valuedcustomer.CustomercustomerID = customer.customerID\n"
                    + "                    LEFT JOIN discount ON discount.discountID = valuedcustomer.DiscountdiscountID\n"
                    + "                    LEFT JOIN fixeddiscount ON discount.discountID = fixeddiscount.DiscountdiscountID\n"
                    + "                    LEFT JOIN flexiblediscount ON discount.discountID = flexiblediscount.DiscountdiscountID\n "
                    + "LEFT JOIN suspendedcustomer ON suspendedcustomer.ValuedCustomerCustomercustomerID = customer.customerID "
                    + "                    LEFT JOIN band ON flexiblediscount.DiscountdiscountID = band.flexiblediscount_DiscountdiscountID \n"
                    + "                    AND band.BandID = (SELECT band.BandID from band WHERE band.lowerBound<= flexiblediscount.aquiredValue "
                    + "AND band.upperBound >= flexiblediscount.aquiredValue AND band.flexiblediscount_DiscountdiscountID = flexiblediscount.DiscountdiscountID)\n"
                    + "                    WHERE suspendedcustomer.ValuedCustomerCustomercustomerID IS NULL "
                    + "ORDER BY customer.customerID ASC;";

            PreparedStatement s = this.getC().prepareStatement(query);

            return s.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet selectPaymentCust() {
        try {
            String query = "SELECT distinct customer.customerID,customer.name,customer.surname,customer.address,customer.phoneNo,customer.postcode,customer.holder\n"
                    + "FROM customer\n"
                    + "INNER JOIN job on job.CustomercustomerID = customer.customerID\n"
                    + "LEFT JOIN payment ON job.JobID = payment.JobJobID "
                    + "LEFT JOIN defaultcustomer ON defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID= customer.customerID"
                    + " WHERE payment.JobJobID IS NULL AND job.finished='1' AND (defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID IS NULL OR defaultcustomer.paid=1);";
            PreparedStatement s = this.getC().prepareStatement(query);
            return s.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public ResultSet selectInvoiceCust() {
        try {
            String query = "SELECT distinct customer.customerID,customer.name,customer.surname,customer.address,customer.phoneNo,customer.postcode,customer.holder\n"
                    + "FROM customer\n"
                    + "INNER JOIN job on job.CustomercustomerID = customer.customerID\n"
                    + "LEFT JOIN payment ON job.JobID = payment.JobJobID WHERE payment.JobJobID IS NULL;";
            PreparedStatement s = this.getC().prepareStatement(query);
            return s.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectAllCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT * FROM customer";
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectSuspendedCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT * FROM customer "
                    + "INNER JOIN suspendedcustomer ON suspendedcustomer.ValuedCustomerCustomercustomerID = customer.customerID "
                    + "LEFT JOIN defaultcustomer ON defaultcustomer.suspendedcustomerValuedCustomerCustomercustomerID = customer.customerID "
                    + "WHERE defaultcustomer.suspendedcustomerValuedCustomerCustomercustomerID IS NULL";
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectBulkSuspendedCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT DISTINCT customer.* FROM customer \n"
                    + "INNER JOIN job ON job.CustomercustomerID = customer.customerID\n"
                    + "RIGHT JOIN valuedjob ON valuedjob.job_JobID = job.JobID "
                    + "LEFT JOIN payment ON payment.jobJobID = job.JobID\n"
                    + "WHERE valuedjob.secondreminder < curdate() AND valuedjob.secondbulk = 0 AND payment.jobJobID IS NULL;";
            PreparedStatement s = this.getC().prepareStatement(query);
            System.out.println(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectDefaultCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT * FROM customer "
                    + "INNER JOIN defaultcustomer ON defaultcustomer.suspendedcustomerValuedCustomerCustomercustomerID = customer.customerID";
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectFirstReminderBulk() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT DISTINCT customer.* FROM customer \n"
                    + "INNER JOIN job ON job.CustomercustomerID = customer.customerID\n"
                    + "RIGHT JOIN valuedjob ON valuedjob.job_JobID = job.JobID "
                    + "LEFT JOIN payment ON payment.jobJobID = job.JobID\n"
                    + "WHERE valuedjob.firstreminder < curdate() AND valuedjob.firstbulk = 0 AND payment.jobJobID IS NULL;";
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Customer> selectFirstReminderCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT DISTINCT customer.* FROM customer \n" +
"INNER JOIN job ON job.CustomercustomerID = customer.customerID\n" +
"INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n "
                    + "LEFT JOIN suspendedcustomer ON suspendedcustomer.ValuedCustomerCustomercustomerID = customer.customerID " +
"LEFT JOIN payment ON payment.JobJobID = job.JobID\n" +
"WHERE valuedjob.firstreminder < curdate() AND payment.JobJobID IS NULL AND suspendedcustomer.ValuedCustomerCustomercustomerID IS NULL";
            System.out.println(query);
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
        public List<Customer> selectSecondCust() {
        try {
            List<Customer> Cust = new ArrayList();
            String query = "SELECT DISTINCT customer.* FROM customer \n" +
"INNER JOIN job ON job.CustomercustomerID = customer.customerID\n" +
"INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n" +
"LEFT JOIN payment ON payment.JobJobID = job.JobID\n" +
"WHERE valuedjob.secondreminder < curdate() AND payment.JobJobID IS NULL";
            PreparedStatement s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            while (a.next()) {
                Customer c = new Customer();
                c.setAddress(a.getString("address"));
                c.setCustomerID(a.getInt("customerID"));
                c.setName(a.getString("name"));
                c.setSurname(a.getString("surname"));
                c.setHolder(a.getString("holder"));
                c.setPostcode(a.getString("postcode"));
                c.setEmail(a.getString("email"));
                c.setPhoneNo(a.getString("phoneNo"));
                Cust.add(c);
            }
            return Cust;
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
