/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Job;
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
public class getCustReportQuery extends Query {

    public getCustReportQuery() {
        super();
    }

        public ResultSet doGetCustDayReportQuery(String from, String to,String ID) {
        PreparedStatement s;
        try {
            List <Job> Jobs = new ArrayList();
            String query = "SELECT sum(job.value) AS \"AValue\", COUNT(DISTINCT job.jobID) AS \"number\",date(job.orderDate) AS \"time\" FROM job  "
                    + "WHERE Job.CustomerCustomerID ='"+ID+"' \n"
                    + "AND Job.OrderDate >='"+from+"' AND Job.OrderDate <='"+to+"' "
                    + "GROUP BY day(job.orderDate);";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet b = s.executeQuery();
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
        public ResultSet doGetCustMonthReportQuery(String from, String to,String ID) {
        PreparedStatement s;
        try {
            List <Job> Jobs = new ArrayList();
            String query = "SELECT sum(job.value) AS \"AValue\", COUNT(DISTINCT job.jobID) AS \"number\",monthname((job.orderDate)) AS \"time\" FROM job   \n"
                    + "WHERE Job.CustomerCustomerID ='"+ID+"' \n"
                    + "AND Job.OrderDate >='"+from+"' AND Job.OrderDate <='"+to+"' "
                    + "GROUP BY month(job.orderDate);";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet b = s.executeQuery();
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
        public ResultSet doGetCustYearReportQuery(String from, String to,String ID) {
        PreparedStatement s;
        try {
            List <Job> Jobs = new ArrayList();
            String query = "SELECT sum(job.value) AS \"AValue\", COUNT(DISTINCT job.jobID) AS \"number\",year((job.orderDate)) AS \"time\" FROM job \n"
                    + "WHERE Job.CustomerCustomerID ='"+ID+"' \n"
                    + "AND Job.OrderDate >='"+from+"' AND Job.OrderDate <='"+to+"' "
                    + "GROUP BY year(job.orderDate)";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            ResultSet b = s.executeQuery();
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}

