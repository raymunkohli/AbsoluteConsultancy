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
 * @author raymun
 */
public class stopAlertQuery extends Query{
    public stopAlertQuery(){
        super();
    }
    
    public void stopNewJobQuery(String JobID){
                try {
            PreparedStatement s;
            String query = "UPDATE job SET job.alert = 1 \n" +
"WHERE job.JobID ='"+JobID+"';";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(getAlertQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
