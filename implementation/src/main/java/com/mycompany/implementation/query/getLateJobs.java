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
public class getLateJobs extends Query {

    public getLateJobs() {
        super();
    }

    public ResultSet getLateJobs() {
        //get jobs which will not meet the deadline set to them
        try {
            PreparedStatement s;
            String Query = "SELECT job.*,\n"
                    + "customer.name,customer.surname,customer.phoneNo,customer.email,\n"
                    + "sum(basetask.duration) AS Time\n"
                    + "FROM job\n"
                    + "INNER JOIN customer ON job.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN task ON task.JobJobID = job.JobID\n"
                    + "INNER JOIN basetask ON basetask.baseTaskID = task.baseTaskbaseTaskID\n"
                    + "WHERE deadlineExceed = 1";
            System.out.println(Query);
            s = this.getC().prepareStatement(Query);
            ResultSet jobs = s.executeQuery();
            return jobs;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
        public void stopLateJob(String jobid) {
            //stop the alert for a job which will not meet the deadline
        try {
            PreparedStatement s;
            String Query = "UPDATE job SET job.deadlineExceed = 0 WHERE job.JobID='"+jobid+"';";
            s = this.getC().prepareStatement(Query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
