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
        try {
            PreparedStatement s;
            String Query = "SELECT job.*,\n"
                    + "customer.name,customer.surname,\n"
                    + "sum(basetask.duration) AS Time\n"
                    + "FROM job\n"
                    + "INNER JOIN customer ON job.CustomercustomerID = customer.customerID\n"
                    + "INNER JOIN task ON task.JobJobID = job.JobID\n"
                    + "INNER JOIN basetask ON basetask.baseTaskID = task.baseTaskbaseTaskID\n"
                    + "WHERE deadlineExceed = 1";
            s = this.getC().prepareStatement(Query);
            ResultSet jobs = s.executeQuery();
            return jobs;
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
