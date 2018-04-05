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
public class getDataForInvoiceQuery extends Query{
    public getDataForInvoiceQuery(){
        super();
    }
    
    public ResultSet getCustomerFromJob(int JobID){
        PreparedStatement s;
            try {
                String query = "SELECT customer.* \n" +
                        "FROM customer\n" +
                        "INNER JOIN job on job.CustomercustomerID = customer.customerID\n" +
                        "WHERE job.JobID =37;";
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet a = s.executeQuery();
                return a;
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
    }
    
    public ResultSet getTaskInformation(int JobID){
                PreparedStatement s;
            try {
                String query = "SELECT basetask.baseTaskID,basetask.price \n" +
                                "FROM basetask\n" +
                                "INNER JOIN task on basetask.baseTaskID = task.taskID\n" +
                                "INNER JOIN job ON job.JobID = task.JobJobID\n" +
                                "WHERE job.JobID ";
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet a = s.executeQuery();
                return a;
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
    }
    
    
    
}
