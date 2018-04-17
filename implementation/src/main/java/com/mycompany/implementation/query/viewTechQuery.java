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
public class viewTechQuery extends Query {

    public viewTechQuery() {
        super();
    }

    public String doViewTechQuery(int StaffID) {
        try {
            PreparedStatement s;
            String Query = "SELECT technicianroom.technicianroom\n"
                    + "FROM technicianroom \n"
                    + "WHERE technicianroom.staff_staffID ='" + StaffID + "'";
            s = this.getC().prepareStatement(Query);
            ResultSet a = s.executeQuery();
            if (a.isLast()){
                return null;
            }
            else{
                a.next();
                return a.getString("technicianroom");
            }
        } catch (SQLException ex) {
            Logger.getLogger(viewTechQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getJobs(String Room) {
        try {
            PreparedStatement s;
            String Query = "SELECT job.JobID, job.deadline,\n"
                    + "customer.holder, customer.name, customer.surname,\n"
                    + "basetask.description, basetask.department,\n"
                    + "task.taskID\n"
                    + "FROM job\n"
                    + "INNER JOIN customer ON customer.customerID = job.CustomercustomerID\n"
                    + "INNER JOIN task ON task.JobJobID = job.JobID\n"
                    + "INNER JOIN basetask ON task.baseTaskbaseTaskID = basetask.baseTaskID\n"
                    + "WHERE task.endDate IS NULL AND (basetask.department ='"+Room+"' ) AND job.finished = 0\n"
                    + "GROUP BY job.JobID ORDER BY job.deadline";
            System.out.println(Query);
            s = this.getC().prepareStatement(Query);
            ResultSet a = s.executeQuery();
            return a;
            
        } catch (SQLException ex) {
            Logger.getLogger(viewTechQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
