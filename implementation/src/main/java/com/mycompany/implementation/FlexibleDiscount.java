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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "flexible_discount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FlexibleDiscount.findAll", query = "SELECT f FROM FlexibleDiscount f")
    , @NamedQuery(name = "FlexibleDiscount.findByDiscountPlandiscountPlanId", query = "SELECT f FROM FlexibleDiscount f WHERE f.discountPlandiscountPlanId = :discountPlandiscountPlanId")
    , @NamedQuery(name = "FlexibleDiscount.findByNoOfJobs", query = "SELECT f FROM FlexibleDiscount f WHERE f.noOfJobs = :noOfJobs")
    , @NamedQuery(name = "FlexibleDiscount.findByDiscountBand", query = "SELECT f FROM FlexibleDiscount f WHERE f.discountBand = :discountBand")})
public class FlexibleDiscount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountPlandiscountPlanId")
    private Integer discountPlandiscountPlanId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "noOfJobs")
    private int noOfJobs;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "discountBand")
    private String discountBand;
    @JoinColumn(name = "DiscountPlandiscountPlanId", referencedColumnName = "discountPlanId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;

    public FlexibleDiscount() {
    }

    public FlexibleDiscount(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public FlexibleDiscount(Integer discountPlandiscountPlanId, int noOfJobs, String discountBand) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
        this.noOfJobs = noOfJobs;
        this.discountBand = discountBand;
    }

    public Integer getDiscountPlandiscountPlanId() {
        return discountPlandiscountPlanId;
    }

    public void setDiscountPlandiscountPlanId(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public int getNoOfJobs() {
        return noOfJobs;
    }

    public void setNoOfJobs(int noOfJobs) {
        this.noOfJobs = noOfJobs;
    }

    public String getDiscountBand() {
        return discountBand;
    }

    public void setDiscountBand(String discountBand) {
        this.discountBand = discountBand;
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
        if (!(object instanceof FlexibleDiscount)) {
            return false;
        }
        FlexibleDiscount other = (FlexibleDiscount) object;
        if ((this.discountPlandiscountPlanId == null && other.discountPlandiscountPlanId != null) || (this.discountPlandiscountPlanId != null && !this.discountPlandiscountPlanId.equals(other.discountPlandiscountPlanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.FlexibleDiscount[ discountPlandiscountPlanId=" + discountPlandiscountPlanId + " ]";
    }
    
}
