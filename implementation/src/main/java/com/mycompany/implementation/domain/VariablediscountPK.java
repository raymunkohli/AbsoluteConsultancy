/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author raymun
 */
@Embeddable
public class VariablediscountPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountdiscountID")
    private int discountdiscountID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "basetask_baseTaskID")
    private int basetaskbaseTaskID;

    public VariablediscountPK() {
    }

    public VariablediscountPK(int discountdiscountID, int basetaskbaseTaskID) {
        this.discountdiscountID = discountdiscountID;
        this.basetaskbaseTaskID = basetaskbaseTaskID;
    }

    public int getDiscountdiscountID() {
        return discountdiscountID;
    }

    public void setDiscountdiscountID(int discountdiscountID) {
        this.discountdiscountID = discountdiscountID;
    }

    public int getBasetaskbaseTaskID() {
        return basetaskbaseTaskID;
    }

    public void setBasetaskbaseTaskID(int basetaskbaseTaskID) {
        this.basetaskbaseTaskID = basetaskbaseTaskID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) discountdiscountID;
        hash += (int) basetaskbaseTaskID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VariablediscountPK)) {
            return false;
        }
        VariablediscountPK other = (VariablediscountPK) object;
        if (this.discountdiscountID != other.discountdiscountID) {
            return false;
        }
        if (this.basetaskbaseTaskID != other.basetaskbaseTaskID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.VariablediscountPK[ discountdiscountID=" + discountdiscountID + ", basetaskbaseTaskID=" + basetaskbaseTaskID + " ]";
    }
    
}
