/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j")
    , @NamedQuery(name = "Job.findByJobId", query = "SELECT j FROM Job j WHERE j.jobId = :jobId")
    , @NamedQuery(name = "Job.findByDeadline", query = "SELECT j FROM Job j WHERE j.deadline = :deadline")
    , @NamedQuery(name = "Job.findByStatus", query = "SELECT j FROM Job j WHERE j.status = :status")
    , @NamedQuery(name = "Job.findByDescription", query = "SELECT j FROM Job j WHERE j.description = :description")
    , @NamedQuery(name = "Job.findByDateCreated", query = "SELECT j FROM Job j WHERE j.dateCreated = :dateCreated")})
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "jobId")
    private Integer jobId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deadline")
    @Temporal(TemporalType.DATE)
    private Date deadline;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "status")
    private String status;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
    @Column(name = "dateCreated")
    @Temporal(TemporalType.DATE)
    private Date dateCreated;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobjobID")
    private Collection<Task> taskCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobjobID")
    private Collection<Payment> paymentCollection;
    @JoinColumn(name = "CustomercustomerId", referencedColumnName = "customerId")
    @ManyToOne(optional = false)
    private Customer customercustomerId;

    public Job() {
    }

    public Job(Integer jobId) {
        this.jobId = jobId;
    }

    public Job(Integer jobId, Date deadline, String status) {
        this.jobId = jobId;
        this.deadline = deadline;
        this.status = status;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @XmlTransient
    public Collection<Task> getTaskCollection() {
        return taskCollection;
    }

    public void setTaskCollection(Collection<Task> taskCollection) {
        this.taskCollection = taskCollection;
    }

    @XmlTransient
    public Collection<Payment> getPaymentCollection() {
        return paymentCollection;
    }

    public void setPaymentCollection(Collection<Payment> paymentCollection) {
        this.paymentCollection = paymentCollection;
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
        hash += (jobId != null ? jobId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.jobId == null && other.jobId != null) || (this.jobId != null && !this.jobId.equals(other.jobId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.Job[ jobId=" + jobId + " ]";
    }
    
}
