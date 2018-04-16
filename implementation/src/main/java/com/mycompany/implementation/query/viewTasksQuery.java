/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Variablediscount;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class viewTasksQuery extends Query{

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
            while(taskResultSet.next()){
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
    public void addTask(String name, String depart, String desc, String price, String durat){

        try {
            String query = "INSERT INTO basetask (taskName,department,description,price,duration) "
                    + "VALUES ('"+name+"','"+depart+"','"+desc+"','"+price+"','"+durat+"');";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void disableTask(String id){

        try {
            String query = "UPDATE basetask SET disabled = 1 WHERE baseTaskID='"+id+"';";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
}
