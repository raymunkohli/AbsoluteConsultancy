/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.io.IOException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raymun
 */
public class createBackUpQuery {
    public createBackUpQuery(){

    }
    public void doCreateBackUpQuery() throws InterruptedException{
                try {
            String Query;
            System.out.println(123123);
            Query = "\"C:\\Program Files (x86)\\MySQL\\MySQL Server 5.7\\bin\\mysqldump\" --user=root --password=1234 --host=localhost --port=3306 sys -r "
                    + "\"C:\\Users\\raymun\\Documents\\Team project git\\AbsoluteConsultancy\\implementation\\sqlBackups\\"+LocalDate.now()+".sql\"";
            System.out.println(Query);
            Process runProcess = Runtime.getRuntime().exec(Query);

        } catch (IOException ex) {
            Logger.getLogger(createBackUpQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}