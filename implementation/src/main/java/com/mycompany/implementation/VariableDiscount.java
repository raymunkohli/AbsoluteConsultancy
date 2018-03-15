/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation;

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
@Table(name = "variable_discount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VariableDiscount.findAll", query = "SELECT v FROM VariableDiscount v")
    , @NamedQuery(name = "VariableDiscount.findByDiscountPlandiscountPlanId", query = "SELECT v FROM VariableDiscount v WHERE v.discountPlandiscountPlanId = :discountPlandiscountPlanId")
    , @NamedQuery(name = "VariableDiscount.findByCalculatedDiscount", query = "SELECT v FROM VariableDiscount v WHERE v.calculatedDiscount = :calculatedDiscount")})
public class VariableDiscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountPlandiscountPlanId")
    private Integer discountPlandiscountPlanId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "calculatedDiscount")
    private float calculatedDiscount;
    @JoinColumn(name = "TasktaskID", referencedColumnName = "taskId")
    @ManyToOne(optional = false)
    private Task tasktaskID;
    @JoinColumn(name = "DiscountPlandiscountPlanId", referencedColumnName = "discountPlanId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;

    public VariableDiscount() {
    }

    public VariableDiscount(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public VariableDiscount(Integer discountPlandiscountPlanId, float calculatedDiscount) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
        this.calculatedDiscount = calculatedDiscount;
    }

    public Integer getDiscountPlandiscountPlanId() {
        return discountPlandiscountPlanId;
    }

    public void setDiscountPlandiscountPlanId(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public float getCalculatedDiscount() {
        return calculatedDiscount;
    }

    public void setCalculatedDiscount(float calculatedDiscount) {
        this.calculatedDiscount = calculatedDiscount;
    }

    public Task getTasktaskID() {
        return tasktaskID;
    }

    public void setTasktaskID(Task tasktaskID) {
        this.tasktaskID = tasktaskID;
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
        hash += (discountPlandiscountPlanId != null ? discountPlandiscountPlanId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VariableDiscount)) {
            return false;
        }
        VariableDiscount other = (VariableDiscount) object;
        if ((this.discountPlandiscountPlanId == null && other.discountPlandiscountPlanId != null) || (this.discountPlandiscountPlanId != null && !this.discountPlandiscountPlanId.equals(other.discountPlandiscountPlanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.VariableDiscount[ discountPlandiscountPlanId=" + discountPlandiscountPlanId + " ]";
    }
    
}
