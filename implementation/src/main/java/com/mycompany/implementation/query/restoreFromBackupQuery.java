/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import java.io.IOException;
/**
 *
 * @author raymun
 */
public class restoreFromBackupQuery {
    public restoreFromBackupQuery(){
        
    }
    public void restore(String path) throws IOException{
        String[] executeCmd = new String[]{"C:\\Program Files (x86)\\MySQL\\MySQL Server 5.7\\bin\\mysql.exe", "--user=root", "--password=1234", "sys","-e", " source "+"C:\\Users\\raymun\\Documents\\Team project git\\AbsoluteConsultancy\\implementation\\sqlBackups\\"+path};
        Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
    }
    
}
