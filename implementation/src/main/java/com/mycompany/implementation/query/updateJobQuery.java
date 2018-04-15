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
 * @author Lukas
 */
public class updateJobQuery extends Query {
    
    public updateJobQuery() {
        super();
    }
    
    public String endJobQuery(int JobID) {
        try{
            PreparedStatement s;
            String Query = "UPDATE TASK)(edited)\n" + "UPDATE "
                    + "task SET task.endDate = \"\" , task.shelf=\"\" WHERE task.taskID =\"\"";
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
}
