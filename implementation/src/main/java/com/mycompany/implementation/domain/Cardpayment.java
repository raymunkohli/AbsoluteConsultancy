/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "cardpayment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cardpayment.findAll", query = "SELECT c FROM Cardpayment c")
    , @NamedQuery(name = "Cardpayment.findByPaymentJobJobID", query = "SELECT c FROM Cardpayment c WHERE c.paymentJobJobID = :paymentJobJobID")
    , @NamedQuery(name = "Cardpayment.findByCardNo", query = "SELECT c FROM Cardpayment c WHERE c.cardNo = :cardNo")
    , @NamedQuery(name = "Cardpayment.findByExpDate", query = "SELECT c FROM Cardpayment c WHERE c.expDate = :expDate")
    , @NamedQuery(name = "Cardpayment.findByType", query = "SELECT c FROM Cardpayment c WHERE c.type = :type")})
public class Cardpayment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PaymentJobJobID")
    private Integer paymentJobJobID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cardNo")
    private int cardNo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "expDate")
    @Temporal(TemporalType.DATE)
    private Date expDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "type")
    private int type;
    @JoinColumn(name = "PaymentJobJobID", referencedColumnName = "JobJobID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Payment payment;

    public Cardpayment() {
    }

    public Cardpayment(Integer paymentJobJobID) {
        this.paymentJobJobID = paymentJobJobID;
    }

    public Cardpayment(Integer paymentJobJobID, int cardNo, Date expDate, int type) {
        this.paymentJobJobID = paymentJobJobID;
        this.cardNo = cardNo;
        this.expDate = expDate;
        this.type = type;
    }

    public Integer getPaymentJobJobID() {
        return paymentJobJobID;
    }

    public void setPaymentJobJobID(Integer paymentJobJobID) {
        this.paymentJobJobID = paymentJobJobID;
    }

    public int getCardNo() {
        return cardNo;
    }

    public void setCardNo(int cardNo) {
        this.cardNo = cardNo;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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
        hash += (paymentJobJobID != null ? paymentJobJobID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cardpayment)) {
            return false;
        }
        Cardpayment other = (Cardpayment) object;
        if ((this.paymentJobJobID == null && other.paymentJobJobID != null) || (this.paymentJobJobID != null && !this.paymentJobJobID.equals(other.paymentJobJobID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.Cardpayment[ paymentJobJobID=" + paymentJobJobID + " ]";
    }
    
}
