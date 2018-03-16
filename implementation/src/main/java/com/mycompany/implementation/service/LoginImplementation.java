/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.service;

import com.mycompany.implementation.data.DataManager;
import com.mycompany.implementation.domain.Staff;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author raymun
 */
@Stateless
public class LoginImplementation implements LoginInterface{
    @EJB
    private DataManager dao;
    @Override
    public List<Staff> Login(String Username, String Password) {
        return dao.Login(Username, Password);
    }
    
}
