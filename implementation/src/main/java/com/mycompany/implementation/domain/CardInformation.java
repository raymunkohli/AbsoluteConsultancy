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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "card_information")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CardInformation.findAll", query = "SELECT c FROM CardInformation c")
    , @NamedQuery(name = "CardInformation.findByPaymentpaymentId", query = "SELECT c FROM CardInformation c WHERE c.paymentpaymentId = :paymentpaymentId")
    , @NamedQuery(name = "CardInformation.findByCardNumber", query = "SELECT c FROM CardInformation c WHERE c.cardNumber = :cardNumber")
    , @NamedQuery(name = "CardInformation.findByCardType", query = "SELECT c FROM CardInformation c WHERE c.cardType = :cardType")
    , @NamedQuery(name = "CardInformation.findByExpiryDate", query = "SELECT c FROM CardInformation c WHERE c.expiryDate = :expiryDate")})
public class CardInformation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PaymentpaymentId")
    private Integer paymentpaymentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cardNumber")
    private int cardNumber;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "cardType")
    private String cardType;
    @Basic(optional = false)
    @NotNull
    @Column(name = "expiryDate")
    @Temporal(TemporalType.DATE)
    private Date expiryDate;
    @JoinColumn(name = "PaymentpaymentId", referencedColumnName = "paymentId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Payment payment;

    public CardInformation() {
    }

    public CardInformation(Integer paymentpaymentId) {
        this.paymentpaymentId = paymentpaymentId;
    }

    public CardInformation(Integer paymentpaymentId, int cardNumber, String cardType, Date expiryDate) {
        this.paymentpaymentId = paymentpaymentId;
        this.cardNumber = cardNumber;
        this.cardType = cardType;
        this.expiryDate = expiryDate;
    }

    public Integer getPaymentpaymentId() {
        return paymentpaymentId;
    }

    public void setPaymentpaymentId(Integer paymentpaymentId) {
        this.paymentpaymentId = paymentpaymentId;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
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
        if (!(object instanceof CardInformation)) {
            return false;
        }
        CardInformation other = (CardInformation) object;
        if ((this.paymentpaymentId == null && other.paymentpaymentId != null) || (this.paymentpaymentId != null && !this.paymentpaymentId.equals(other.paymentpaymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.CardInformation[ paymentpaymentId=" + paymentpaymentId + " ]";
    }
    
}
