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
@Table(name = "valued_customer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ValuedCustomer.findAll", query = "SELECT v FROM ValuedCustomer v")
    , @NamedQuery(name = "ValuedCustomer.findByDiscountPlandiscountPlanId", query = "SELECT v FROM ValuedCustomer v WHERE v.discountPlandiscountPlanId = :discountPlandiscountPlanId")})
public class ValuedCustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DiscountPlandiscountPlanId")
    private Integer discountPlandiscountPlanId;
    @JoinColumn(name = "DiscountPlandiscountPlanId", referencedColumnName = "discountPlanId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Discount discount;
    @JoinColumn(name = "CustomercustomerId", referencedColumnName = "customerId")
    @ManyToOne(optional = false)
    private Customer customercustomerId;

    public ValuedCustomer() {
    }

    public ValuedCustomer(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public Integer getDiscountPlandiscountPlanId() {
        return discountPlandiscountPlanId;
    }

    public void setDiscountPlandiscountPlanId(Integer discountPlandiscountPlanId) {
        this.discountPlandiscountPlanId = discountPlandiscountPlanId;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Customer getCustomercustomerId() {
        return customercustomerId;
    }

    public void setCustomercustomerId(Customer customercustomerId) {
        this.customercustomerId = customercustomerId;
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
        if (!(object instanceof ValuedCustomer)) {
            return false;
        }
        ValuedCustomer other = (ValuedCustomer) object;
        if ((this.discountPlandiscountPlanId == null && other.discountPlandiscountPlanId != null) || (this.discountPlandiscountPlanId != null && !this.discountPlandiscountPlanId.equals(other.discountPlandiscountPlanId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.ValuedCustomer[ discountPlandiscountPlanId=" + discountPlandiscountPlanId + " ]";
    }
    
}
