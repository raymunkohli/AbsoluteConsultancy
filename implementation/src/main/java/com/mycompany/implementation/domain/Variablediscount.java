/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "variablediscount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Variablediscount.findAll", query = "SELECT v FROM Variablediscount v")
    , @NamedQuery(name = "Variablediscount.findByDiscountdiscountID", query = "SELECT v FROM Variablediscount v WHERE v.variablediscountPK.discountdiscountID = :discountdiscountID")
    , @NamedQuery(name = "Variablediscount.findByAmount", query = "SELECT v FROM Variablediscount v WHERE v.amount = :amount")
    , @NamedQuery(name = "Variablediscount.findByBasetaskbaseTaskID", query = "SELECT v FROM Variablediscount v WHERE v.variablediscountPK.basetaskbaseTaskID = :basetaskbaseTaskID")})
public class Variablediscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected VariablediscountPK variablediscountPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private double amount;

    public Variablediscount() {
    }

    public Variablediscount(VariablediscountPK variablediscountPK) {
        this.variablediscountPK = variablediscountPK;
    }

    public Variablediscount(VariablediscountPK variablediscountPK, double amount) {
        this.variablediscountPK = variablediscountPK;
        this.amount = amount;
    }

    public Variablediscount(int discountdiscountID, int basetaskbaseTaskID) {
        this.variablediscountPK = new VariablediscountPK(discountdiscountID, basetaskbaseTaskID);
    }

    public VariablediscountPK getVariablediscountPK() {
        return variablediscountPK;
    }

    public void setVariablediscountPK(VariablediscountPK variablediscountPK) {
        this.variablediscountPK = variablediscountPK;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (variablediscountPK != null ? variablediscountPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Variablediscount)) {
            return false;
        }
        Variablediscount other = (Variablediscount) object;
        if ((this.variablediscountPK == null && other.variablediscountPK != null) || (this.variablediscountPK != null && !this.variablediscountPK.equals(other.variablediscountPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Variablediscount[ variablediscountPK=" + variablediscountPK + " ]";
    }
    
}
