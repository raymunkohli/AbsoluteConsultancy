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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "discount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Discount.findAll", query = "SELECT d FROM Discount d")
    , @NamedQuery(name = "Discount.findByDiscountPlanId", query = "SELECT d FROM Discount d WHERE d.discountPlanId = :discountPlanId")
    , @NamedQuery(name = "Discount.findByDescription", query = "SELECT d FROM Discount d WHERE d.description = :description")
    , @NamedQuery(name = "Discount.findByDiscountPlan", query = "SELECT d FROM Discount d WHERE d.discountPlan = :discountPlan")})
public class Discount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "discountPlanId")
    private Integer discountPlanId;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
    @Size(max = 255)
    @Column(name = "discountPlan")
    private String discountPlan;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private VariableDiscount variableDiscount;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private FlexibleDiscount flexibleDiscount;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private FixedDiscount fixedDiscount;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "discount")
    private ValuedCustomer valuedCustomer;

    public Discount() {
    }

    public Discount(Integer discountPlanId) {
        this.discountPlanId = discountPlanId;
    }

    public Integer getDiscountPlanId() {
        return discountPlanId;
    }

    public void setDiscountPlanId(Integer discountPlanId) {
        this.discountPlanId = discountPlanId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDiscountPlan() {
        return discountPlan;
    }

    public void setDiscountPlan(String discountPlan) {
        this.discountPlan = discountPlan;
    }

    public VariableDiscount getVariableDiscount() {
        return variableDiscount;
    }

    public void setVariableDiscount(VariableDiscount variableDiscount) {
        this.variableDiscount = variableDiscount;
    }

    public FlexibleDiscount getFlexibleDiscount() {
        return flexibleDiscount;
    }

    public void setFlexibleDiscount(FlexibleDiscount flexibleDiscount) {
        this.flexibleDiscount = flexibleDiscount;
    }

    public FixedDiscount getFixedDiscount() {
        return fixedDiscount;
    }

    public void setFixedDiscount(FixedDiscount fixedDiscount) {
        this.fixedDiscount = fixedDiscount;
    }

    public ValuedCustomer getValuedCustomer() {
        return valuedCustomer;
    }

    public void setValuedCustomer(ValuedCustomer valuedCustomer) {
        this.valuedCustomer = valuedCustomer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (discountPlanId != null ? discountPlanId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Discount)) {
            return false;
        }
        Discount other = (Discount) object;
        if ((this.discountPlanId == null && other.discountPlanId != null) || (this.discountPlanId != null && !this.discountPlanId.equals(other.discountPlanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Discount[ discountPlanId=" + discountPlanId + " ]";
    }
    
}
