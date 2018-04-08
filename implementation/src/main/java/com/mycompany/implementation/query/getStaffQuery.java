/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Staff;
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
public class getStaffQuery extends Query{
    public getStaffQuery(){
        super();
    }
    public List<Staff> doGetStaffQuery(){
        PreparedStatement s;
        try {
            List<Staff> AllStaff = new ArrayList();
            String query = "SELECT staff.* FROM staff \n" +
            "WHERE staff.employeeType='Technician' OR staff.employeeType='ShiftManager' OR staff.employeeType='OfficeManager'";     
            s = this.getC().prepareStatement(query);
            ResultSet staff = s.executeQuery();
            while (staff.next()){
                Staff z = new Staff();
                z.setEmployeeType(staff.getString("employeeType"));
                z.setFirstName(staff.getString("firstName"));
                z.setSurName(staff.getString("surName"));
                z.setStaffID(staff.getInt("staffID"));
                AllStaff.add(z);
            }
            return AllStaff;
            
        } catch (SQLException ex) {
            Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
