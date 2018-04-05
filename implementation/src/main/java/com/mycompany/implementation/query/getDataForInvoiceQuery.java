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
public class getDataForInvoiceQuery extends Query{
    public getDataForInvoiceQuery(){
        super();
    }
    
    public Customer getCustomerFromJob(int JobID){
        PreparedStatement s;
            try {
                String query = "SELECT customer.*\n" +
                        "FROM customer\n" +
                        "INNER JOIN job on job.CustomercustomerID = customer.customerID\n" +
                        "WHERE job.JobID =37;";
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
    
    public List<Basetask> getTaskInformation(int JobID){
                PreparedStatement s;
            try {
                String query = "SELECT basetask.baseTaskID,basetask.price \n" +
                                "FROM basetask\n" +
                                "INNER JOIN task on basetask.baseTaskID = task.baseTaskbaseTaskID\n" +
                                "INNER JOIN job ON job.JobID = task.JobJobID\n" +
                                "WHERE job.JobID='"+JobID+"'";
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet a = s.executeQuery();
                List<Basetask> taskList = new ArrayList();
                while(a.next()){
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
    public Job getJobInfo(int JobID){
        PreparedStatement s;
            try {
                String query = "SELECT job.* FROM job WHERE job.JobID='"+JobID+"';";
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet a = s.executeQuery();
                a.next();
                Job j = new Job();
                j.setJobID(a.getInt("JobID"));
                j.setSpecInstructions(a.getString("specInstructions"));
                j.setValue(Double.parseDouble(a.getString("value")));
                
                return j;
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
    }
    
    
    
}
