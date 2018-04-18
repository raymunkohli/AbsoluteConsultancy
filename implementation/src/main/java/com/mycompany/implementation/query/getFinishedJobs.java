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
        //rreturn all the jobs in the system marked as finished
                try {
            PreparedStatement s;
            String query = " SELECT \n" +
"    job.JobID,\n" +
"    job.deadline,\n" +
"    customer.holder,\n" +
"    customer.name,\n" +
"    customer.surname,\n" +
"    basetask.description,\n" +
"    basetask.department,\n" +
"    task.taskID\n" +
"FROM\n" +
"    job\n" +
"        INNER JOIN\n" +
"    customer ON customer.customerID = job.CustomercustomerID\n" +
"        LEFT JOIN\n" +
"    task ON job.jobID = task.JobJobID\n" +
"        AND task.taskID = (SELECT \n" +
"            task.taskID\n" +
"        FROM\n" +
"            task\n" +
"                INNER JOIN\n" +
"            basetask ON basetask.baseTaskID = task.baseTaskbaseTaskID\n" +
"        WHERE\n" +
"            task.endDate IS NULL\n" +
"                AND task.JobJobID = job.JobID\n" +
"        ORDER BY CASE basetask.department\n" +
"            WHEN 'Copy' THEN 1\n" +
"            WHEN 'Development' THEN 2\n" +
"            WHEN 'Finishing' THEN 3\n" +
"            WHEN 'Packaging' THEN 4\n" +
"            ELSE 0\n" +
"        END\n" +
"        LIMIT 1)\n" +
"        LEFT JOIN\n" +
"    basetask ON task.baseTaskbaseTaskID = basetask.baseTaskID\n" +
"WHERE\n" +
"    task.endDate IS NULL\n" +
"GROUP BY job.JobID\n" +
"ORDER BY job.deadline;";
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
