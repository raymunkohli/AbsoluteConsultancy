/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.domain.Job;
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
public class getDataForInvoiceQuery extends Query {

    public getDataForInvoiceQuery() {
        super();
    }

    public Customer getCustomerFromJob(int JobID) {
        PreparedStatement s;
        try {
            String query = "SELECT customer.*\n"
                    + "FROM customer\n"
                    + "INNER JOIN job on job.CustomercustomerID = customer.customerID\n"
                    + "WHERE job.JobID ='" + JobID + "';";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            Customer c = new Customer();
            a.next();
            c.setAddress(a.getString("address"));
            c.setCustomerID(a.getInt("customerID"));
            c.setName(a.getString("name"));
            c.setSurname(a.getString("surname"));
            c.setPhoneNo(a.getString("phoneNo"));
            c.setEmail(a.getString("email"));
            c.setPostcode(a.getString("postcode"));
            c.setHolder(a.getString("holder"));
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Basetask> getTaskInformation(int JobID) {
        PreparedStatement s;
        try {
            String query = "SELECT basetask.baseTaskID,basetask.price \n"
                    + "FROM basetask\n"
                    + "INNER JOIN task on basetask.baseTaskID = task.baseTaskbaseTaskID\n"
                    + "INNER JOIN job ON job.JobID = task.JobJobID\n"
                    + "WHERE job.JobID='" + JobID + "'";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            List<Basetask> taskList = new ArrayList();
            while (a.next()) {
                Basetask task = new Basetask();
                task.setBaseTaskID(a.getInt("baseTaskID"));
                task.setPrice(Double.parseDouble(a.getString("price")));
                taskList.add(task);
            }
            return taskList;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Job getJobInfo(int JobID) {
        PreparedStatement s;
        try {
            String query = "SELECT job.* FROM job WHERE job.JobID='" + JobID + "';";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            a.next();
            Job j = new Job();
            j.setJobID(a.getInt("JobID"));
            j.setSpecInstructions(a.getString("specInstructions"));
            j.setValue(Double.parseDouble(a.getString("value")));
            j.setSurcharge(Double.parseDouble(a.getString("surcharge")));
            return j;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getDiscountGivenCust(int JobID) {
        PreparedStatement s;
        try {
            String query = "SELECT discount.discountID,discount.discountType,\n"
                    + "fixeddiscount.percentDiscount,\n"
                    + "band.discount,band.upperBound, band.BandID, flexiblediscount.aquiredValue \n"
                    + "FROM discount\n"
                    + "LEFT JOIN fixeddiscount on discount.discountID = fixeddiscount.DiscountdiscountID\n"
                    + "LEFT JOIN flexiblediscount ON discount.discountID = flexiblediscount.DiscountdiscountID\n"
                    + "LEFT JOIN band ON band.BandID = flexiblediscount.bandBandID\n"
                    + "INNER JOIN valuedcustomer ON valuedcustomer.DiscountdiscountID =discount.discountID\n"
                    + "WHERE valuedcustomer.CustomercustomerID ='" + JobID + "';";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet a = s.executeQuery();
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public double updateFlexDiscount(int discountID, double value) {
        PreparedStatement s;
        try {
            String query = "UPDATE flexiblediscount SET flexiblediscount.aquiredValue = flexiblediscount.aquiredValue +" + value + " "
                    + "WHERE flexiblediscount.DiscountdiscountID='" + discountID + "';";
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
            String secondQuery = "SELECT flexiblediscount.aquiredValue \n"
                    + "FROM flexiblediscount \n"
                    + "WHERE flexiblediscount.DiscountdiscountID ='" + discountID + "';";
            s = this.getC().prepareStatement(secondQuery);
            ResultSet getNewValue = s.executeQuery();
            getNewValue.next();
            double aquiredValue = getNewValue.getDouble("aquiredValue");
            return aquiredValue;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public void upgradeBand(int discountID, double value) {
        PreparedStatement s;
        try {
            String query = "UPDATE flexiblediscount \n"
                    + "SET flexiblediscount.bandBandID = \n"
                    + "(SELECT band.BandID from band WHERE band.lowerBound<='" + value + "' AND band.upperBound >= '" + value + "' )\n"
                    + "WHERE flexiblediscount.DiscountdiscountID ='" + discountID + "';";
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
