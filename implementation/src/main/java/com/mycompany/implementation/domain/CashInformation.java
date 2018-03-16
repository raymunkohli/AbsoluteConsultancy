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
@Table(name = "cash_information")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CashInformation.findAll", query = "SELECT c FROM CashInformation c")
    , @NamedQuery(name = "CashInformation.findByPaymentpaymentId", query = "SELECT c FROM CashInformation c WHERE c.paymentpaymentId = :paymentpaymentId")
    , @NamedQuery(name = "CashInformation.findByCashAmount", query = "SELECT c FROM CashInformation c WHERE c.cashAmount = :cashAmount")})
public class CashInformation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PaymentpaymentId")
    private Integer paymentpaymentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cashAmount")
    private short cashAmount;
    @JoinColumn(name = "StaffstaffId", referencedColumnName = "staffId")
    @ManyToOne(optional = false)
    private Staff staffstaffId;
    @JoinColumn(name = "PaymentpaymentId", referencedColumnName = "paymentId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Payment payment;

    public CashInformation() {
    }

    public CashInformation(Integer paymentpaymentId) {
        this.paymentpaymentId = paymentpaymentId;
    }

    public CashInformation(Integer paymentpaymentId, short cashAmount) {
        this.paymentpaymentId = paymentpaymentId;
        this.cashAmount = cashAmount;
    }

    public Integer getPaymentpaymentId() {
        return paymentpaymentId;
    }

    public void setPaymentpaymentId(Integer paymentpaymentId) {
        this.paymentpaymentId = paymentpaymentId;
    }

    public short getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(short cashAmount) {
        this.cashAmount = cashAmount;
    }

    public Staff getStaffstaffId() {
        return staffstaffId;
    }

    public void setStaffstaffId(Staff staffstaffId) {
        this.staffstaffId = staffstaffId;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentpaymentId != null ? paymentpaymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CashInformation)) {
            return false;
        }
        CashInformation other = (CashInformation) object;
        if ((this.paymentpaymentId == null && other.paymentpaymentId != null) || (this.paymentpaymentId != null && !this.paymentpaymentId.equals(other.paymentpaymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.CashInformation[ paymentpaymentId=" + paymentpaymentId + " ]";
    }
    
}
