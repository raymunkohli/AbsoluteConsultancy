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
@Table(name = "fixed_discount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FixedDiscount.findAll", query = "SELECT f FROM FixedDiscount f")
    , @NamedQuery(name = "FixedDiscount.findByDiscountPlandiscountPlanId", query = "SELECT f FROM FixedDiscount f WHERE f.discountPlandiscountPlanId = :discountPlandiscountPlanId")
    , @NamedQuery(name = "FixedDiscount.findByPercentage", query = "SELECT f FROM FixedDiscount f WHERE f.percentage = :percentage")})
public class FixedDiscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountPlandiscountPlanId")
    private Integer discountPlandiscountPlanId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "percentage")
    private float percentage;
    @JoinColumn(name = "DiscountPlandiscountPlanId", referencedColumnName = "discountPlanId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;

    public FixedDiscount() {
    }

    public FixedDiscount(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public FixedDiscount(Integer discountPlandiscountPlanId, float percentage) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
        this.percentage = percentage;
    }

    public Integer getDiscountPlandiscountPlanId() {
        return discountPlandiscountPlanId;
    }

    public void setDiscountPlandiscountPlanId(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
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
        if (!(object instanceof FixedDiscount)) {
            return false;
        }
        FixedDiscount other = (FixedDiscount) object;
        if ((this.discountPlandiscountPlanId == null && other.discountPlandiscountPlanId != null) || (this.discountPlandiscountPlanId != null && !this.discountPlandiscountPlanId.equals(other.discountPlandiscountPlanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.FixedDiscount[ discountPlandiscountPlanId=" + discountPlandiscountPlanId + " ]";
    }
    
}
