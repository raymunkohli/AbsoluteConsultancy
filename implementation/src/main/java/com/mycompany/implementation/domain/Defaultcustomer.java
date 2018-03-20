/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
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
@Table(name = "defaultcustomer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Defaultcustomer.findAll", query = "SELECT d FROM Defaultcustomer d")
    , @NamedQuery(name = "Defaultcustomer.findBySuspendedCustomerValuedCustomerCustomercustomerID", query = "SELECT d FROM Defaultcustomer d WHERE d.suspendedCustomerValuedCustomerCustomercustomerID = :suspendedCustomerValuedCustomerCustomercustomerID")})
public class Defaultcustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "suspendedCustomerValuedCustomerCustomercustomerID")
    private Integer suspendedCustomerValuedCustomerCustomercustomerID;
    @JoinColumn(name = "suspendedCustomerValuedCustomerCustomercustomerID", referencedColumnName = "ValuedCustomerCustomercustomerID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Suspendedcustomer suspendedcustomer;

    public Defaultcustomer() {
    }

    public Defaultcustomer(Integer suspendedCustomerValuedCustomerCustomercustomerID) {
        this.suspendedCustomerValuedCustomerCustomercustomerID = suspendedCustomerValuedCustomerCustomercustomerID;
    }

    public Integer getSuspendedCustomerValuedCustomerCustomercustomerID() {
        return suspendedCustomerValuedCustomerCustomercustomerID;
    }

    public void setSuspendedCustomerValuedCustomerCustomercustomerID(Integer suspendedCustomerValuedCustomerCustomercustomerID) {
        this.suspendedCustomerValuedCustomerCustomercustomerID = suspendedCustomerValuedCustomerCustomercustomerID;
    }

    public Suspendedcustomer getSuspendedcustomer() {
        return suspendedcustomer;
    }

    public void setSuspendedcustomer(Suspendedcustomer suspendedcustomer) {
        this.suspendedcustomer = suspendedcustomer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (suspendedCustomerValuedCustomerCustomercustomerID != null ? suspendedCustomerValuedCustomerCustomercustomerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Defaultcustomer)) {
            return false;
        }
        Defaultcustomer other = (Defaultcustomer) object;
        if ((this.suspendedCustomerValuedCustomerCustomercustomerID == null && other.suspendedCustomerValuedCustomerCustomercustomerID != null) || (this.suspendedCustomerValuedCustomerCustomercustomerID != null && !this.suspendedCustomerValuedCustomerCustomercustomerID.equals(other.suspendedCustomerValuedCustomerCustomercustomerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.Defaultcustomer[ suspendedCustomerValuedCustomerCustomercustomerID=" + suspendedCustomerValuedCustomerCustomercustomerID + " ]";
    }
    
}
