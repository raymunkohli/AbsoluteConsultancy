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
 * @author Lukas
 */
public class getTechnicianJobQuery extends Query {
    public getTechnicianJobQuery(){
        super();
    }
    
    public ResultSet doGetTechnicianJobQuery(int custid){
                PreparedStatement s;
            try {
                String query = "SELECT job.JobID, job.deadline,\n" +
"                               customer.holder, customer.name, customer.surname,\n" +
"                               basetask.description, basetask.department,\n" +
"                               task.taskID\n" +
"                               FROM job\n" +
"                               INNER JOIN customer ON customer.customerID = job.CustomercustomerID\n" +
"                               INNER JOIN task ON task.JobJobID = job.JobID\n" +
"                               INNER JOIN basetask ON task.baseTaskbaseTaskID = basetask.baseTaskID\n" +
"                               WHERE task.endDate IS NULL\n" +
"                               GROUP BY job.JobID";
                
                System.out.println(query);
                s = this.getC().prepareStatement(query);
                ResultSet b =s.executeQuery();
                return b;
            } catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
       
    }
    
    //public ResultSet
}
