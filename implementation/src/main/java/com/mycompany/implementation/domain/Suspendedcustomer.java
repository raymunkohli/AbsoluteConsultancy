/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "suspendedcustomer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Suspendedcustomer.findAll", query = "SELECT s FROM Suspendedcustomer s")
    , @NamedQuery(name = "Suspendedcustomer.findByValuedCustomerCustomercustomerID", query = "SELECT s FROM Suspendedcustomer s WHERE s.valuedCustomerCustomercustomerID = :valuedCustomerCustomercustomerID")})
public class Suspendedcustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ValuedCustomerCustomercustomerID")
    private Integer valuedCustomerCustomercustomerID;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "suspendedcustomer")
    private Defaultcustomer defaultcustomer;
    @JoinColumn(name = "ValuedCustomerCustomercustomerID", referencedColumnName = "CustomercustomerID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Valuedcustomer valuedcustomer;

    public Suspendedcustomer() {
    }

    public Suspendedcustomer(Integer valuedCustomerCustomercustomerID) {
        this.valuedCustomerCustomercustomerID = valuedCustomerCustomercustomerID;
    }

    public Integer getValuedCustomerCustomercustomerID() {
        return valuedCustomerCustomercustomerID;
    }

    public void setValuedCustomerCustomercustomerID(Integer valuedCustomerCustomercustomerID) {
        this.valuedCustomerCustomercustomerID = valuedCustomerCustomercustomerID;
    }

    public Defaultcustomer getDefaultcustomer() {
        return defaultcustomer;
    }

    public void setDefaultcustomer(Defaultcustomer defaultcustomer) {
        this.defaultcustomer = defaultcustomer;
    }

    public Valuedcustomer getValuedcustomer() {
        return valuedcustomer;
    }

    public void setValuedcustomer(Valuedcustomer valuedcustomer) {
        this.valuedcustomer = valuedcustomer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (valuedCustomerCustomercustomerID != null ? valuedCustomerCustomercustomerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Suspendedcustomer)) {
            return false;
        }
        Suspendedcustomer other = (Suspendedcustomer) object;
        if ((this.valuedCustomerCustomercustomerID == null && other.valuedCustomerCustomercustomerID != null) || (this.valuedCustomerCustomercustomerID != null && !this.valuedCustomerCustomercustomerID.equals(other.valuedCustomerCustomercustomerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Suspendedcustomer[ valuedCustomerCustomercustomerID=" + valuedCustomerCustomercustomerID + " ]";
    }
    
}
