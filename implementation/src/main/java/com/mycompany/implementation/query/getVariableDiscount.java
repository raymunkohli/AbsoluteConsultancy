/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Discount;
import com.mycompany.implementation.domain.Task;
import com.mycompany.implementation.domain.Variablediscount;
import com.mycompany.implementation.domain.VariablediscountPK;
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
public class getVariableDiscount {
        private Connection c;
    private ResultSet r;
    
    public getVariableDiscount(String dbname, String user, String pass){
        String url = "jdbc:mysql://localhost:3306/sys?zeroDateTimeBehavior=convertToNull"; //db location
        try {
            Class.forName("com.mysql.jdbc.Driver"); //make instance of driver
            this.c = DriverManager.getConnection(url,user,pass); //connect to db
                        
        } 
        
          catch (ClassNotFoundException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Variablediscount> doGetVariableDiscount(int custID){
        PreparedStatement s;
        List<Variablediscount> a = new ArrayList<>();
        try{
            String Query ="SELECT variablediscount.amount,variablediscount.basetask_baseTaskID FROM variablediscount\n" +
                            "INNER JOIN valuedcustomer ON\n" +
                            "valuedcustomer.DiscountdiscountID = variablediscount.DiscountdiscountID\n" +
                            "WHERE CustomercustomerID ='" + custID + "';";
            System.out.println(Query);
            s = this.c.prepareStatement(Query);
            ResultSet b = s.executeQuery();
            while(b.next()){
                Variablediscount c = new Variablediscount();
                c.setAmount(b.getDouble("amount"));
                c.setVariablediscountPK(new VariablediscountPK(1, b.getInt("basetask_baseTaskID")));
                a.add(c);
                System.out.println(b.getDouble("amount"));
            }
            return a;
        }
       catch (SQLException ex) {
                Logger.getLogger(addCustomerQuery.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        
    }
}
