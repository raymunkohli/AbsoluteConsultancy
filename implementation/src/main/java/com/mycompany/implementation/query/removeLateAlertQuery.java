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
public class removeLateAlertQuery extends Query {

    public removeLateAlertQuery() {
        super();
    }

    public void removeLatePaymentAlert(String jobid) {
        try {
            String query = "UPDATE valuedjob SET alertknown = 1 WHERE job_JobID ='" + jobid + "';";

            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(removeLateAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeFirstReminderAlert(String jobid) {
        try {
            String query = "UPDATE valuedjob SET firstalert = 1 WHERE job_JobID ='" + jobid + "';";

            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(removeLateAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeSuspendedAlert(String custid) {
        try {
            String query = "UPDATE suspendedcustomer SET alert = 1 WHERE  suspendedcustomer.ValuedCustomerCustomercustomerID='" + custid + "';";

            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(removeLateAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public void removeDefaultAlert(String custid) {
        try {
            String query = "UPDATE defaultcustomer SET alert = 1 WHERE  defaultcustomer.suspendedCustomerValuedCustomerCustomercustomerID='" + custid + "';";
            System.out.println(query);
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(removeLateAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
