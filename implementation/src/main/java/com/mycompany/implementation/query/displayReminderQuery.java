/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Job;
import java.sql.Date;
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
public class displayReminderQuery extends Query {

    public displayReminderQuery() {
        super();
    }

    public List<Job> getJobSecond(String custID) {
        
        //query to generate the information needed for the second reminder letter alert
        try {
            PreparedStatement s;
            String Query = "SELECT job.* FROM job\n"
                    + "LEFT JOIN payment ON payment.JobJobID = job.JobID "
                    + "RIGHT JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "WHERE job.CustomercustomerID ='" + custID + "' AND payment.JobJobID IS NULL AND valuedjob.secondreminder < curdate()";
            s = this.getC().prepareStatement(Query);
            System.out.println(Query);
            List<Job> a = new ArrayList();
            ResultSet b = s.executeQuery();
            while(b.next()){
                Job c = new Job();
                c.setOrderDate(Date.valueOf(b.getString("orderDate").split(" ")[0]));
                c.setValue(b.getDouble("value"));
                c.setJobID(b.getInt("JobID"));
                a.add(c);
            }
            return a;
            
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     public List<Job> getJobFirst(String custID) {
         //get information for the alert for the first job reminder
        try {
            PreparedStatement s;
            String Query = "SELECT job.* FROM job\n"
                    + "LEFT JOIN payment ON payment.JobJobID = job.JobID "
                    + "RIGHT JOIN valuedjob ON job.JobID = valuedjob.job_JobID\n"
                    + "WHERE job.CustomercustomerID ='" + custID + "' AND payment.JobJobID IS NULL AND valuedjob.firstreminder < curdate()";
            s = this.getC().prepareStatement(Query);
            System.out.println(Query);
            List<Job> a = new ArrayList();
            ResultSet b = s.executeQuery();
            while(b.next()){
                Job c = new Job();
                c.setOrderDate(Date.valueOf(b.getString("orderDate").split(" ")[0]));
                c.setValue(b.getDouble("value"));
                c.setJobID(b.getInt("JobID"));
                a.add(c);
            }
            return a;
            
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
