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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "payment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")
    , @NamedQuery(name = "Payment.findByPaymentId", query = "SELECT p FROM Payment p WHERE p.paymentId = :paymentId")
    , @NamedQuery(name = "Payment.findByAmount", query = "SELECT p FROM Payment p WHERE p.amount = :amount")
    , @NamedQuery(name = "Payment.findByHasBeenPaid", query = "SELECT p FROM Payment p WHERE p.hasBeenPaid = :hasBeenPaid")})
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "paymentId")
    private Integer paymentId;
    @Column(name = "amount")
    private Short amount;
    @Size(max = 255)
    @Column(name = "hasBeenPaid")
    private String hasBeenPaid;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "payment")
    private CashInformation cashInformation;
    @JoinColumn(name = "JobjobID", referencedColumnName = "jobId")
    @ManyToOne(optional = false)
    private Job jobjobID;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "payment")
    private CardInformation cardInformation;

    public Payment() {
    }

    public Payment(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Short getAmount() {
        return amount;
    }

    public void setAmount(Short amount) {
        this.amount = amount;
    }

    public String getHasBeenPaid() {
        return hasBeenPaid;
    }

    public void setHasBeenPaid(String hasBeenPaid) {
        this.hasBeenPaid = hasBeenPaid;
    }

    public CashInformation getCashInformation() {
        return cashInformation;
    }

    public void setCashInformation(CashInformation cashInformation) {
        this.cashInformation = cashInformation;
    }

    public Job getJobjobID() {
        return jobjobID;
    }

    public void setJobjobID(Job jobjobID) {
        this.jobjobID = jobjobID;
    }

    public CardInformation getCardInformation() {
        return cardInformation;
    }

    public void setCardInformation(CardInformation cardInformation) {
        this.cardInformation = cardInformation;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentId != null ? paymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentId == null && other.paymentId != null) || (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Payment[ paymentId=" + paymentId + " ]";
    }
    
}
