/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.backingbeans;

import com.mycompany.implementation.service.LoginInterface;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;



/**
 *
 * @author raymun
 */
@ManagedBean (name = "LoginBackingBean")
public class LoginBackingBean {
    @EJB
    private LoginInterface em;
    
}
