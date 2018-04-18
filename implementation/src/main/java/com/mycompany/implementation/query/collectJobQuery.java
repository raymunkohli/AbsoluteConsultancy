/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class collectJobQuery extends Query{
    public collectJobQuery(){
        super();
    }
    
    public void doCollect(String job){
        
        //mark a job as collected 
                try {
            PreparedStatement s;
            String query = "UPDATE job SET collectionDate='"+LocalDateTime.now()+"' WHERE JobID='"+job+"';";
            s = this.getC().prepareStatement(query);
            System.out.println(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(getAlertQuery.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
}
