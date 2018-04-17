/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Basetask;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class viewTasksQuery extends Query {

    public viewTasksQuery() {
        super();
    }

    public List<Basetask> doViewTasks() {
        List<Basetask> allTheTasks = new ArrayList();
        ResultSet taskResultSet;
        try {
            String query = "SELECT * FROM basetask WHERE disabled=0;";
            PreparedStatement s = this.getC().prepareStatement(query);
            taskResultSet = s.executeQuery();
            while (taskResultSet.next()) {
                Basetask a = new Basetask();
                a.setBaseTaskID(taskResultSet.getInt("baseTaskID"));
                a.setTaskName(taskResultSet.getString("taskName"));
                a.setDepartment(taskResultSet.getString("department"));
                a.setPrice(taskResultSet.getDouble("price"));
                a.setDescription(taskResultSet.getString("description"));
                a.setBaseTaskID(taskResultSet.getInt("baseTaskID"));
                a.setDuration(taskResultSet.getInt("duration"));
                allTheTasks.add(a);
            }
            return allTheTasks;

        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public int addTask(String name, String depart, String desc, String price, String durat) {

        try {
            String query = "INSERT INTO basetask (taskName,department,description,price,duration) "
                    + "VALUES ('" + name + "','" + depart + "','" + desc + "','" + price + "','" + durat + "');";
            PreparedStatement s = this.getC().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            s.executeUpdate();
            ResultSet newid = s.getGeneratedKeys();
            if (newid.next()) {
                return newid.getInt(1);
            }
            return -1;
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public void disableTask(String id) {

        try {
            String query = "UPDATE basetask SET disabled = 1 WHERE baseTaskID='" + id + "';";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void startTask(String id, String staff) {

        try {
            String query = "UPDATE task SET startDate='" + LocalDateTime.now() + "',StaffstaffID='" + staff + "' WHERE taskID = '" + id + "';";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void finishTask(String id, String Shelf) {

        try {
            String query = "UPDATE task SET endDate='" + LocalDateTime.now() + "', shelf='" + Shelf + "' WHERE taskID = '" + id + "';";
            System.out.println(query);
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkIfLast(String jobid) {

        try {
            String query = "SELECT task.JobJobID FROM task WHERE task.endDate IS NULL AND task.JobJobID ='" + jobid + "';";
            PreparedStatement s = this.getC().prepareStatement(query);
            System.out.println(query);
            ResultSet a = s.executeQuery();
            return a.next();

        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public void finishJob(String jobid) {

        try {
            String query = "UPDATE job SET finished=1 WHERE JobID='" + jobid + "';";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void fixVarDiscount(String task) {

        try {
            String query = "INSERT INTO variablediscount (variablediscount.DiscountdiscountID, variablediscount.basetask_baseTaskID,variablediscount.amount) \n"
                    + "SELECT discount.discountID,'" + task + "',0 FROM discount WHERE discount.discountType = \"Variable\";";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
