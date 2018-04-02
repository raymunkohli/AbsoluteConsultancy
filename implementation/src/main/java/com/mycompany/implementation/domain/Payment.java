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
@Table(name = "payment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")
    , @NamedQuery(name = "Payment.findByJobJobID", query = "SELECT p FROM Payment p WHERE p.jobJobID = :jobJobID")
    , @NamedQuery(name = "Payment.findByPaymentDate", query = "SELECT p FROM Payment p WHERE p.paymentDate = :paymentDate")})
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "JobJobID")
    private Integer jobJobID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "paymentDate")
    private int paymentDate;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "payment")
    private Cardpayment cardpayment;
    @JoinColumn(name = "JobJobID", referencedColumnName = "JobID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Job job;

    public Payment() {
    }

    public Payment(Integer jobJobID) {
        this.jobJobID = jobJobID;
    }

    public Payment(Integer jobJobID, int paymentDate) {
        this.jobJobID = jobJobID;
        this.paymentDate = paymentDate;
    }

    public Integer getJobJobID() {
        return jobJobID;
    }

    public void setJobJobID(Integer jobJobID) {
        this.jobJobID = jobJobID;
    }

    public int getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(int paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Cardpayment getCardpayment() {
        return cardpayment;
    }

    public void setCardpayment(Cardpayment cardpayment) {
        this.cardpayment = cardpayment;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (jobJobID != null ? jobJobID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.jobJobID == null && other.jobJobID != null) || (this.jobJobID != null && !this.jobJobID.equals(other.jobJobID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Payment[ jobJobID=" + jobJobID + " ]";
    }
    
}
