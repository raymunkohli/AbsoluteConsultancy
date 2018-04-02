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
@Table(name = "fixeddiscount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fixeddiscount.findAll", query = "SELECT f FROM Fixeddiscount f")
    , @NamedQuery(name = "Fixeddiscount.findByDiscountdiscountID", query = "SELECT f FROM Fixeddiscount f WHERE f.discountdiscountID = :discountdiscountID")
    , @NamedQuery(name = "Fixeddiscount.findByPercentDiscount", query = "SELECT f FROM Fixeddiscount f WHERE f.percentDiscount = :percentDiscount")})
public class Fixeddiscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountdiscountID")
    private Integer discountdiscountID;
    @Column(name = "percentDiscount")
    private Integer percentDiscount;
    @JoinColumn(name = "DiscountdiscountID", referencedColumnName = "discountID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;

    public Fixeddiscount() {
    }

    public Fixeddiscount(Integer discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public Integer getDiscountdiscountID() {
        return discountdiscountID;
    }

    public void setDiscountdiscountID(Integer discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public Integer getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(Integer percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
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
        if (!(object instanceof Fixeddiscount)) {
            return false;
        }
        Fixeddiscount other = (Fixeddiscount) object;
        if ((this.discountdiscountID == null && other.discountdiscountID != null) || (this.discountdiscountID != null && !this.discountdiscountID.equals(other.discountdiscountID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Fixeddiscount[ discountdiscountID=" + discountdiscountID + " ]";
    }
    
}
