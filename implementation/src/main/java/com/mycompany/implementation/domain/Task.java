/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "task")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Task.findAll", query = "SELECT t FROM Task t")
    , @NamedQuery(name = "Task.findByTaskID", query = "SELECT t FROM Task t WHERE t.taskID = :taskID")
    , @NamedQuery(name = "Task.findByShelf", query = "SELECT t FROM Task t WHERE t.shelf = :shelf")
    , @NamedQuery(name = "Task.findByStartDate", query = "SELECT t FROM Task t WHERE t.startDate = :startDate")
    , @NamedQuery(name = "Task.findByEndDate", query = "SELECT t FROM Task t WHERE t.endDate = :endDate")})
public class Task implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "taskID")
    private Integer taskID;
    @Size(max = 10)
    @Column(name = "shelf")
    private String shelf;
    @Column(name = "startDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    @Column(name = "endDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    @JoinColumn(name = "baseTaskbaseTaskID", referencedColumnName = "baseTaskID")
    @ManyToOne(optional = false)
    private Basetask baseTaskbaseTaskID;
    @JoinColumn(name = "JobJobID", referencedColumnName = "JobID")
    @ManyToOne(optional = false)
    private Job jobJobID;
    @JoinColumn(name = "StaffstaffID", referencedColumnName = "staffID")
    @ManyToOne
    private Staff staffstaffID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "task")
    private Collection<Enquire> enquireCollection;

    public Task() {
    }

    public Task(Integer taskID) {
        this.taskID = taskID;
    }

    public Integer getTaskID() {
        return taskID;
    }

    public void setTaskID(Integer taskID) {
        this.taskID = taskID;
    }

    public String getShelf() {
        return shelf;
    }

    public void setShelf(String shelf) {
        this.shelf = shelf;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Basetask getBaseTaskbaseTaskID() {
        return baseTaskbaseTaskID;
    }

    public void setBaseTaskbaseTaskID(Basetask baseTaskbaseTaskID) {
        this.baseTaskbaseTaskID = baseTaskbaseTaskID;
    }

    public Job getJobJobID() {
        return jobJobID;
    }

    public void setJobJobID(Job jobJobID) {
        this.jobJobID = jobJobID;
    }

    public Staff getStaffstaffID() {
        return staffstaffID;
    }

    public void setStaffstaffID(Staff staffstaffID) {
        this.staffstaffID = staffstaffID;
    }

    @XmlTransient
    public Collection<Enquire> getEnquireCollection() {
        return enquireCollection;
    }

    public void setEnquireCollection(Collection<Enquire> enquireCollection) {
        this.enquireCollection = enquireCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (taskID != null ? taskID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Task)) {
            return false;
        }
        Task other = (Task) object;
        if ((this.taskID == null && other.taskID != null) || (this.taskID != null && !this.taskID.equals(other.taskID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Task[ taskID=" + taskID + " ]";
    }
    
}
