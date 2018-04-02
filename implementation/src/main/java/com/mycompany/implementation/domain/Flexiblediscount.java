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
@Table(name = "flexiblediscount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Flexiblediscount.findAll", query = "SELECT f FROM Flexiblediscount f")
    , @NamedQuery(name = "Flexiblediscount.findByDiscountdiscountID", query = "SELECT f FROM Flexiblediscount f WHERE f.discountdiscountID = :discountdiscountID")
    , @NamedQuery(name = "Flexiblediscount.findByAquiredValue", query = "SELECT f FROM Flexiblediscount f WHERE f.aquiredValue = :aquiredValue")})
public class Flexiblediscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountdiscountID")
    private Integer discountdiscountID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "aquiredValue")
    private int aquiredValue;
    @JoinColumn(name = "DiscountdiscountID", referencedColumnName = "discountID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;
    @JoinColumn(name = "bandBandID", referencedColumnName = "BandID")
    @ManyToOne(optional = false)
    private Band bandBandID;

    public Flexiblediscount() {
    }

    public Flexiblediscount(Integer discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public Flexiblediscount(Integer discountdiscountID, int aquiredValue) {
        this.discountdiscountID = discountdiscountID;
        this.aquiredValue = aquiredValue;
    }

    public Integer getDiscountdiscountID() {
        return discountdiscountID;
    }

    public void setDiscountdiscountID(Integer discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public int getAquiredValue() {
        return aquiredValue;
    }

    public void setAquiredValue(int aquiredValue) {
        this.aquiredValue = aquiredValue;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Band getBandBandID() {
        return bandBandID;
    }

    public void setBandBandID(Band bandBandID) {
        this.bandBandID = bandBandID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (discountdiscountID != null ? discountdiscountID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Flexiblediscount)) {
            return false;
        }
        Flexiblediscount other = (Flexiblediscount) object;
        if ((this.discountdiscountID == null && other.discountdiscountID != null) || (this.discountdiscountID != null && !this.discountdiscountID.equals(other.discountdiscountID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Flexiblediscount[ discountdiscountID=" + discountdiscountID + " ]";
    }
    
}
