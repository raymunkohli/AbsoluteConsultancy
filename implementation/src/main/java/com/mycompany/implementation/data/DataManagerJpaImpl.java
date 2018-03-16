/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.data;

import com.mycompany.implementation.domain.Staff;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author raymun
 */

@Stateless
public class DataManagerJpaImpl implements DataManager {
    @PersistenceContext
    
    private EntityManager em;
    
    @Override
    public List<Staff> Login(String Username, String Password) {
        TypedQuery<Staff> query =  em.createNamedQuery("Staff.login",Staff.class).setParameter(Username,Password);
        return query.getResultList();    
    }
    
    
    
}
