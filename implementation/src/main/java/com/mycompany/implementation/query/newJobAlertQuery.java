/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.domain.Staff;
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
public class newJobAlertQuery extends Query {

    public newJobAlertQuery() {
        super();
    }

    public ResultSet getAlerts() {
        try {
            PreparedStatement s;
            List<Job> AllJobs = new ArrayList();
            String query = "SELECT job.*, customer.name, customer.surname FROM job WHERE job.alert=0;";
            s = this.getC().prepareStatement(query);
            ResultSet jobs = s.executeQuery();
   
            return jobs;
        } catch (SQLException ex) {
            Logger.getLogger(newJobAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }


    }
}


