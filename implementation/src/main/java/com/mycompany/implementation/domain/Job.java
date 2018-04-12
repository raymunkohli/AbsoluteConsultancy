/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j")
    , @NamedQuery(name = "Job.findByJobID", query = "SELECT j FROM Job j WHERE j.jobID = :jobID")
    , @NamedQuery(name = "Job.findByOrderDate", query = "SELECT j FROM Job j WHERE j.orderDate = :orderDate")
    , @NamedQuery(name = "Job.findByCollectionDate", query = "SELECT j FROM Job j WHERE j.collectionDate = :collectionDate")
    , @NamedQuery(name = "Job.findBySpecInstructions", query = "SELECT j FROM Job j WHERE j.specInstructions = :specInstructions")
    , @NamedQuery(name = "Job.findByDeadline", query = "SELECT j FROM Job j WHERE j.deadline = :deadline")
    , @NamedQuery(name = "Job.findBySurcharge", query = "SELECT j FROM Job j WHERE j.surcharge = :surcharge")
    , @NamedQuery(name = "Job.findByValue", query = "SELECT j FROM Job j WHERE j.value = :value")})
public class Job implements Serializable {

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "value")
    private double value;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "surcharge")
    private double surcharge;
    @Column(name = "alert")
    private Short alert;
    @Column(name = "finished")
    private Short finished;
    @Basic(optional = false)
    @NotNull
    @Column(name = "paid")
    private short paid;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "JobID")
    private Integer jobID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "orderDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Column(name = "collectionDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date collectionDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "specInstructions")
    private String specInstructions;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deadline")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deadline;
    @JoinColumn(name = "CustomercustomerID", referencedColumnName = "customerID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Customer customercustomerID;

    public Job() {
    }

    public Job(Integer jobID) {
        this.jobID = jobID;
    }

    public Job(Integer jobID, Date orderDate, String specInstructions, Date deadline, double surcharge, double value) {
        this.jobID = jobID;
        this.orderDate = orderDate;
        this.specInstructions = specInstructions;
        this.deadline = deadline;
        this.surcharge = surcharge;
        this.value = value;
    }

    public Integer getJobID() {
        return jobID;
    }

    public void setJobID(Integer jobID) {
        this.jobID = jobID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getCollectionDate() {
        return collectionDate;
    }

    public void setCollectionDate(Date collectionDate) {
        this.collectionDate = collectionDate;
    }

    public String getSpecInstructions() {
        return specInstructions;
    }

    public void setSpecInstructions(String specInstructions) {
        this.specInstructions = specInstructions;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }


    public Customer getCustomercustomerID() {
        return customercustomerID;
    }

    public void setCustomercustomerID(Customer customercustomerID) {
        this.customercustomerID = customercustomerID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (jobID != null ? jobID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.jobID == null && other.jobID != null) || (this.jobID != null && !this.jobID.equals(other.jobID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Job[ jobID=" + jobID + " ]";
    }

    public short getPaid() {
        return paid;
    }

    public void setPaid(short paid) {
        this.paid = paid;
    }


    public Short getFinished() {
        return finished;
    }

    public void setFinished(Short finished) {
        this.finished = finished;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public double getSurcharge() {
        return surcharge;
    }

    public void setSurcharge(double surcharge) {
        this.surcharge = surcharge;
    }

    public Short getAlert() {
        return alert;
    }

    public void setAlert(Short alert) {
        this.alert = alert;
    }
    
}
