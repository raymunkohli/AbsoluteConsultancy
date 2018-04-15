/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymu
 */
public class addJobQuery extends Query {

    public addJobQuery() {
        super();
    }

    public int doAddJobQuery(int c, LocalDateTime order, LocalDateTime deadline, String Spec, double value, double surcharge, int late, double z) {
        PreparedStatement s;
        try {
            String query = "INSERT INTO Job(CustomercustomerID,orderDate,specInstructions,deadline,value,surcharge,deadlineExceed,number)"
                    + "Values('" + c + "','" + order + "','" + Spec + "','"
                    + deadline + "','" + value + "','" + surcharge + "','" + late + "','" + z + "');";

            s = this.getC().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            int rows = s.executeUpdate();
            ResultSet JobIDSet = s.getGeneratedKeys();
            JobIDSet.next();
            int JobID = JobIDSet.getInt(1);
            return JobID;

        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public void addValuedJob(int id, LocalDate late, LocalDate Reminder, LocalDate Suspend, LocalDate defaultDate) {
        PreparedStatement s;
        try {
            String query = "INSERT INTO valuedJob (job_JobID,alertdate,firstreminder,secondreminder,defaultd) VALUES"
                    + " ('"+id+"','"+late+"','"+Reminder+"','"+Suspend+"','"+defaultDate+"');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();


        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
