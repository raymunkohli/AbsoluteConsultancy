/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class updateBulk extends Query {

    public updateBulk() {
        super();
    }

    public void updateSuspended() {
        try {
            String query = "UPDATE valuedjob SET firstbulk= 1 WHERE firstbulk = 0 && firstreminder < curdate();";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(updateBulk.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDefault() {
        try {
            String query = "UPDATE valuedjob SET secondbulk= 1 WHERE secondbulk = 0 && secondreminder < curdate();";
            PreparedStatement s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(updateBulk.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
}
