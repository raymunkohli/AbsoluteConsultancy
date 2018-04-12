/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

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
public class getAlertQuery extends Query {

    public getAlertQuery() {
        super();
    }

    public ResultSet getNewJobQuery() {
        try {
            PreparedStatement s;
            String query = "SELECT job.deadline, job.JobID, job.specInstructions,\n"
                    + "customer.name, customer.surname\n"
                    + "FROM job \n"
                    + "INNER JOIN customer ON customer.customerID = job.CustomercustomerID\n"
                    + "WHERE job.alert=0;";
            s = this.getC().prepareStatement(query);
            ResultSet jobs = s.executeQuery();
            return jobs;
        } catch (SQLException ex) {
            Logger.getLogger(getAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<String> getTasksFromJob(int jobid) {
        try {
            List<String> task = new ArrayList();
            PreparedStatement s;
            String query = "SELECT basetask.description\n"
                    + "FROM basetask\n"
                    + "INNER JOIN task on task.baseTaskbaseTaskID = basetask.baseTaskID\n"
                    + "INNER JOIN job ON job.JobID = task.JobJobID\n"
                    + "WHERE job.JobID ='"+jobid+"';";
            s = this.getC().prepareStatement(query);
            ResultSet tasks = s.executeQuery();
            while(tasks.next()){
                task.add(tasks.getString("description"));
            }
            return  task;
            
        } catch (SQLException ex) {
            Logger.getLogger(getAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

}
