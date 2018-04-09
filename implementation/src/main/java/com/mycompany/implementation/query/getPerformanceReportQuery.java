/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class getPerformanceReportQuery extends Query {

    public getPerformanceReportQuery() {
        super();
    }

    //finish this SQL
    public ResultSet dayShiftEarly(LocalDate Start, LocalDate End) {
        try {
            String Query = "SELECT Date(task.startDate) as \"Date\", \n"
                    + "sum(IF( baseTask.department = \"Copy\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Copy Room\",\n"
                    + "sum(IF( baseTask.department = \"Development\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Development\",\n"
                    + "sum(IF( baseTask.department = \"Finishing\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Finishing\",\n"
                    + "sum(IF( baseTask.department = \"Packaging\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Packaging\"\n"
                    + "FROM Task RIGHT JOIN baseTask ON baseTask.baseTaskID = task.baseTaskbaseTaskID \n"
                    + "WHERE task.startDate IS NOT NULL\n"
                    + "AND time(task.endDate) >= \"05:00\" AND time(task.endDate) <=\"14:30\"\n"
                    + "AND date(task.endDate) >= '" + Start + "' AND date(task.endDate) <= '" + End + "'\n"
                    + "GROUP by Date;";
            PreparedStatement s;
            System.out.println(Query);
            s = this.getC().prepareStatement(Query);
            ResultSet results = s.executeQuery();
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(getPerformanceReportQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet dayShiftLate(LocalDate Start, LocalDate End) {
        try {
            String Query = "SELECT Date(task.startDate) as \"Date\", \n"
                    + "sum(IF( baseTask.department = \"Copy\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Copy Room\",\n"
                    + "sum(IF( baseTask.department = \"Development\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Development\",\n"
                    + "sum(IF( baseTask.department = \"Finishing\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Finishing\",\n"
                    + "sum(IF( baseTask.department = \"Packaging\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Packaging\"\n"
                    + "FROM Task RIGHT JOIN baseTask ON baseTask.baseTaskID = task.baseTaskbaseTaskID \n"
                    + "WHERE task.startDate IS NOT NULL\n"
                    + "AND time(task.endDate) >= \"14:31\" AND time(task.endDate)<=\"22:00\"\n"
                    + "AND date(task.endDate) >= '" + Start + "' AND date(task.endDate) <= '" + End + "'\n"
                    + "GROUP by Date;";
            PreparedStatement s;
            s = this.getC().prepareStatement(Query);
            ResultSet results = s.executeQuery();
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(getPerformanceReportQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet nightShift(LocalDate Start, LocalDate End) {
        try {
            String Query = "SELECT Date(task.startDate) as \"Date\", \n"
                    + "sum(IF( baseTask.department = \"Copy\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Copy Room\",\n"
                    + "sum(IF( baseTask.department = \"Development\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Development\",\n"
                    + "sum(IF( baseTask.department = \"Finishing\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Finishing\",\n"
                    + "sum(IF( baseTask.department = \"Packaging\",TIMESTAMPDIFF(minute,task.startDate,task.endDate), 0))AS \"Packaging\"\n"
                    + "FROM Task RIGHT JOIN baseTask ON baseTask.baseTaskID = task.baseTaskbaseTaskID \n"
                    + "WHERE task.startDate IS NOT NULL\n"
                    + "AND (time(task.endDate) >= time(\"22:01\") AND time(task.endDate)<=time(\"23:59\")) OR\n"
                    + "(time(task.endDate) <= time(\"04:59\") AND time(task.endDate) >= time(\"00:00\"))\n"
                    + "AND date(task.endDate) >= '" + Start + "' AND date(task.endDate) <= '" + End + "'\n"
                    + "GROUP by Date;";
            PreparedStatement s;
            s = this.getC().prepareStatement(Query);
            ResultSet results = s.executeQuery();
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(getPerformanceReportQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

}
