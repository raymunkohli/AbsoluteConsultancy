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
public class getCurrentJobs extends Query{
    
    public getCurrentJobs(){
        super();
    }
    
    public ResultSet doGetCurrentJobs(){
        //no longer used in the final implementation
         try {
            PreparedStatement s;
            String Query = "SELECT job.JobID,job.deadline,\n" +
"                    customer.name,customer.surname,\n" +
"                    BaseTask.description, BaseTask.department\n" +
"                    FROM job\n" +
"                    INNER JOIN customer ON job.CustomercustomerID = customer.customerID\n" +
"                    LEFT JOIN task ON Task.JobJobID = job.JobID\n" +
"                    RIGHT JOIN baseTask ON baseTask.baseTaskID = task.baseTaskbaseTaskID\n" +
"                    WHERE job.paid = 0 AND task.startDate IS NOT NULL AND task.endDate IS NULL;";
            s = this.getC().prepareStatement(Query);
            ResultSet jobs = s.executeQuery();
            return jobs;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
    
}
