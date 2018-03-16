/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.service;

import com.mycompany.implementation.domain.Staff;
import java.util.List;

/**
 *
 * @author raymun
 */
public interface NewInterface {
    List <Staff> Login(String Username, String Password);
    
}
