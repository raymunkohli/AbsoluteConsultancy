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
 * @author raymu
 */
public class addTaskQuery extends Query {

    public addTaskQuery() {
        super();
    }

    public void doAddTaskQuery(int Job, int bID) {

        try {
            PreparedStatement s;
            String Query = "INSERT INTO task (JobJobID,baseTaskbaseTaskID) values('" + Job + "','" + bID + "');";
            s = this.getC().prepareStatement(Query);
            s.execute();
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public String getDesc(String bID) {

        try {
            PreparedStatement s;
            String Query = "SELECT description FROM basetask WHERE baseTaskID='"+bID+"';";
            s = this.getC().prepareStatement(Query);
            ResultSet a = s.executeQuery();
            a.next();
            return a.getString("description");
        } catch (SQLException ex) {
            Logger.getLogger(addTaskQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
