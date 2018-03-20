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
import javax.persistence.ManyToOne;
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
@Table(name = "valuedcustomer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Valuedcustomer.findAll", query = "SELECT v FROM Valuedcustomer v")
    , @NamedQuery(name = "Valuedcustomer.findByCustomercustomerID", query = "SELECT v FROM Valuedcustomer v WHERE v.customercustomerID = :customercustomerID")})
public class Valuedcustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "CustomercustomerID")
    private Integer customercustomerID;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "valuedcustomer")
    private Suspendedcustomer suspendedcustomer;
    @JoinColumn(name = "DiscountdiscountID", referencedColumnName = "discountID")
    @ManyToOne
    private Discount discountdiscountID;
    @JoinColumn(name = "CustomercustomerID", referencedColumnName = "customerID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Customer customer;

    public Valuedcustomer() {
    }

    public Valuedcustomer(Integer customercustomerID) {
        this.customercustomerID = customercustomerID;
    }

    public Integer getCustomercustomerID() {
        return customercustomerID;
    }

    public void setCustomercustomerID(Integer customercustomerID) {
        this.customercustomerID = customercustomerID;
    }

    public Suspendedcustomer getSuspendedcustomer() {
        return suspendedcustomer;
    }

    public void setSuspendedcustomer(Suspendedcustomer suspendedcustomer) {
        this.suspendedcustomer = suspendedcustomer;
    }

    public Discount getDiscountdiscountID() {
        return discountdiscountID;
    }

    public void setDiscountdiscountID(Discount discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customercustomerID != null ? customercustomerID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Valuedcustomer)) {
            return false;
        }
        Valuedcustomer other = (Valuedcustomer) object;
        if ((this.customercustomerID == null && other.customercustomerID != null) || (this.customercustomerID != null && !this.customercustomerID.equals(other.customercustomerID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.Valuedcustomer[ customercustomerID=" + customercustomerID + " ]";
    }
    
}
