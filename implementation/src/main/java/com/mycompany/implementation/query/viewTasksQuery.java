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
        List<Basetask> allTheTasks = new ArrayList<Basetask>();
        ResultSet taskResultSet;
        try {
            String query = "SELECT * FROM basetask";
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
                allTheTasks.add(a);
            }
            return allTheTasks;
            
        } catch (SQLException ex) {
            Logger.getLogger(viewTasksQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

      
    }
 
}
