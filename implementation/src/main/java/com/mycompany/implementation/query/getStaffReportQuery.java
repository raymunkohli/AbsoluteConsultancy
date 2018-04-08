/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class getStaffReportQuery extends Query {

    public getStaffReportQuery() {
        super();
    }

    public ResultSet doGetStaffReportQuery(ArrayList<Integer> Staff,LocalDateTime to, LocalDateTime from) {
        String SelectStaff = new String();
        for (int i = 0; i != Staff.size(); i++) {
            if (i == Staff.size() - 1) {
                SelectStaff = SelectStaff + "staff.staffID='" + Staff.get(i) + "' )";
            } else {
                SelectStaff = SelectStaff + "staff.staffID='" + Staff.get(i) + "' OR ";
            }
        }
        String Query = "SELECT staff.*, \n"
                + "task.startDate, task.endDate,task.JobJobID,\n"
                + "basetask.department, basetask.baseTaskID\n"
                + "FROM staff\n"
                + "INNER JOIN task ON task.StaffstaffID = staff.staffID\n"
                + "INNER JOIN basetask ON basetask.baseTaskID = task.baseTaskbaseTaskID "
                + "AND task.startDate >'"+from+"'AND task.endDate <'"+to+"' "
                + "WHERE task.endDate IS NOT NULL AND ( "+SelectStaff+" ORDER BY staff.staffID, basetask.baseTaskID";
        System.out.println(Query);
        PreparedStatement s;
        try {

            s= this.getC().prepareStatement(Query);
            ResultSet Results = s.executeQuery();
            
            return Results;
   
        } catch (SQLException ex) {
            
            Logger.getLogger(getStaffReportQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
        
        

    }

}
