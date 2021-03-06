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
public class checkForLatePaymentQuery extends Query {

    public checkForLatePaymentQuery() {
        super();
    }

    public ResultSet getAlerts() {
        try {
            
            // checks for the 10th of the month alert and returns info about the customer to be used
            // in the alert
            PreparedStatement s;
            String Query = "SELECT job.JobID, job.orderDate, customer.*,\n"
                    + "valuedjob.*\n"
                    + "FROM customer\n"
                    + "INNER JOIN job ON job.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN valuedcustomer ON valuedcustomer.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "LEFT JOIN payment ON payment.JobJobID = job.JobID\n"
                    + "WHERE payment.JobJobID IS NULL AND valuedjob.alertknown = 0";
            s = this.getC().prepareStatement(Query);
            ResultSet custAlert = s.executeQuery();

            return custAlert;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getReminderAlerts() {
        try {
            
            //code for the first reminder alert and return info to display it
      
            PreparedStatement s;
            String Query = "SELECT job.JobID, job.orderDate, customer.*,\n"
                    + "valuedjob.*\n"
                    + "FROM customer\n"
                    + "INNER JOIN job ON job.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN valuedcustomer ON valuedcustomer.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "LEFT JOIN payment ON payment.JobJobID = job.JobID\n"
                    + "WHERE payment.JobJobID IS NULL AND valuedjob.firstalert = 0";
            s = this.getC().prepareStatement(Query);
            ResultSet custAlert = s.executeQuery();

            return custAlert;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void suspendAccounts() {
        //suspend all accounts which have not met the second reminder deadline
        try {
            PreparedStatement s;
            String Query = "INSERT IGNORE into suspendedcustomer (suspendedcustomer.ValuedCustomerCustomercustomerID)\n"
                    + "SELECT job.CustomercustomerID FROM job\n"
                    + "INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "LEFT JOIN payment ON payment.JobJobID = job.JobID\n"
                    + "WHERE payment.JobJobID IS NULL AND valuedjob.secondreminder < curdate();";
            s = this.getC().prepareStatement(Query);

            s.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getSuspendedAlerts() {
        //return information about new suspended customers
        try {
            PreparedStatement s;
            String Query = "SELECT customer.customerID,customer.name,customer.surname,customer.email \n"
                    + "FROM customer\n"
                    + "INNER JOIN suspendedcustomer ON customer.customerID = suspendedcustomer.ValuedCustomerCustomercustomerID\n"
                    + "WHERE suspendedcustomer.alert =0";
            s = this.getC().prepareStatement(Query);
            ResultSet custAlert = s.executeQuery();

            return custAlert;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void defaultAccounts() {
        
        //default all customers who have not met the default deadline
        try {
            PreparedStatement s;
            String Query = "INSERT IGNORE into defaultcustomer (defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID)\n"
                    + "                     SELECT job.CustomercustomerID FROM job\n"
                    + "                     INNER JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "                     LEFT JOIN payment ON payment.JobJobID = job.JobID\n"
                    + "                     WHERE payment.JobJobID IS NULL AND valuedjob.defaultd < curdate();";
            s = this.getC().prepareStatement(Query);

            s.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getDefaultAlerts() {
        
        //gets data for newly defaulted accounts
        try {
            PreparedStatement s;
            String Query = "SELECT customer.customerID,customer.name,customer.surname\n"
                    + "FROM customer\n"
                    + "INNER JOIN defaultcustomer ON defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID = customer.customerID \n"
                    + "WHERE defaultcustomer.alert =0";
            s = this.getC().prepareStatement(Query);
            ResultSet custAlert = s.executeQuery();

            return custAlert;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public void resetDiscount(){
        //reset flex discount every month
              try {
            PreparedStatement s;
            String Query = "UPDATE flexiblediscount SET flexiblediscount.aquiredValue = 0 ;";
            s = this.getC().prepareStatement(Query);
            s.executeUpdate();

       
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
        
        }
    }
}
