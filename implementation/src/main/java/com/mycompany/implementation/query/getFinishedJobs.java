/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Customer;
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
public class getFinishedJobs extends Query{
    public getFinishedJobs(){
        super();
    }
    
    public ResultSet doGetFinishedJobs(){
                try {
            PreparedStatement s;
            String query = "SELECT job.JobID, job.finished,\n" +
"                    customer.holder, customer.name, customer.surname, customer.name,customer.surname, \n" +
"                    basetask.description, basetask.department,\n" +
"                    task.taskID ,task.shelf \n" +
"                    FROM job \n" +
"                    INNER JOIN customer ON customer.customerID = job.CustomercustomerID \n" +
"                    LEFT JOIN task ON task.JobJobID = job.JobID \n" +
"                    INNER JOIN basetask ON task.baseTaskbaseTaskID = basetask.baseTaskID \n" +
"                    WHERE (task.endDate IS NULL OR job.finished = 1) AND job.collectionDate IS NULL \n" +
"                    GROUP BY job.JobID "
                    + "";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet cust = s.executeQuery();
            return cust;
        } catch (SQLException ex) {
            Logger.getLogger(searchForCustQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
