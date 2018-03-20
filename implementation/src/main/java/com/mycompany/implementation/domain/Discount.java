/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "discount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Discount.findAll", query = "SELECT d FROM Discount d")
    , @NamedQuery(name = "Discount.findByDiscountID", query = "SELECT d FROM Discount d WHERE d.discountID = :discountID")
    , @NamedQuery(name = "Discount.findByDiscountType", query = "SELECT d FROM Discount d WHERE d.discountType = :discountType")})
public class Discount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "discountID")
    private Integer discountID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "discountType")
    private String discountType;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private Flexiblediscount flexiblediscount;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private Fixeddiscount fixeddiscount;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private Variablediscount variablediscount;
    @OneToMany(mappedBy = "discountdiscountID")
    private Collection<Valuedcustomer> valuedcustomerCollection;

    public Discount() {
    }

    public Discount(Integer discountID) {
        this.discountID = discountID;
    }

    public Discount(Integer discountID, String discountType) {
        this.discountID = discountID;
        this.discountType = discountType;
    }

    public Integer getDiscountID() {
        return discountID;
    }

    public void setDiscountID(Integer discountID) {
        this.discountID = discountID;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public Flexiblediscount getFlexiblediscount() {
        return flexiblediscount;
    }

    public void setFlexiblediscount(Flexiblediscount flexiblediscount) {
        this.flexiblediscount = flexiblediscount;
    }

    public Fixeddiscount getFixeddiscount() {
        return fixeddiscount;
    }

    public void setFixeddiscount(Fixeddiscount fixeddiscount) {
        this.fixeddiscount = fixeddiscount;
    }

    public Variablediscount getVariablediscount() {
        return variablediscount;
    }

    public void setVariablediscount(Variablediscount variablediscount) {
        this.variablediscount = variablediscount;
    }

    @XmlTransient
    public Collection<Valuedcustomer> getValuedcustomerCollection() {
        return valuedcustomerCollection;
    }

    public void setValuedcustomerCollection(Collection<Valuedcustomer> valuedcustomerCollection) {
        this.valuedcustomerCollection = valuedcustomerCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (discountID != null ? discountID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Discount)) {
            return false;
        }
        Discount other = (Discount) object;
        if ((this.discountID == null && other.discountID != null) || (this.discountID != null && !this.discountID.equals(other.discountID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.Discount[ discountID=" + discountID + " ]";
    }
    
}
