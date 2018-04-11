/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class addStaffQuery extends Query {

    public addStaffQuery() {
        super();
    }

    public void doAddStaffQuery(String name, String surname, String password, String role) {
        PreparedStatement s;
        try {
            String query = "INSERT INTO staff (firstName,surName,employeeType,password) "
                    + "VALUES ('" + name + "','" + surname + "','" + role + "','" + password + "');";
            System.out.println(query);
            s = this.getC().prepareStatement(query);
            s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void addTechnicianQuery(String name, String surname, String password, String role, String Department) {
        PreparedStatement s;
        try {
            String query = "INSERT INTO staff (firstName,surName,employeeType,password) "
                    + "VALUES ('" + name + "','" + surname + "','" + role + "','" + password + "');";
            System.out.println(query);
            s = this.getC().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            int rows = s.executeUpdate();
            ResultSet key = s.getGeneratedKeys();
            key.next();
            int newStaffID = key.getInt(1);
            
            String secondQuery = "INSERT INTO technicianroom (staff_staffID,technicianroom) values"
                    + "('"+newStaffID+"','"+Department+"');";
            s = this.getC().prepareStatement(secondQuery);
            s.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
