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
import javax.validation.constraints.NotNull;
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
    , @NamedQuery(name = "Task.findByTaskId", query = "SELECT t FROM Task t WHERE t.taskId = :taskId")
    , @NamedQuery(name = "Task.findByStatus", query = "SELECT t FROM Task t WHERE t.status = :status")
    , @NamedQuery(name = "Task.findByDateStarted", query = "SELECT t FROM Task t WHERE t.dateStarted = :dateStarted")
    , @NamedQuery(name = "Task.findByDateCompleted", query = "SELECT t FROM Task t WHERE t.dateCompleted = :dateCompleted")
    , @NamedQuery(name = "Task.findByDepartment", query = "SELECT t FROM Task t WHERE t.department = :department")
    , @NamedQuery(name = "Task.findByShelfOnCompletion", query = "SELECT t FROM Task t WHERE t.shelfOnCompletion = :shelfOnCompletion")})
public class Task implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "taskId")
    private Integer taskId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "status")
    private String status;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dateStarted")
    @Temporal(TemporalType.DATE)
    private Date dateStarted;
    @Column(name = "dateCompleted")
    @Temporal(TemporalType.DATE)
    private Date dateCompleted;
    @Size(max = 255)
    @Column(name = "department")
    private String department;
    @Size(max = 10)
    @Column(name = "shelfOnCompletion")
    private String shelfOnCompletion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tasktaskID")
    private Collection<VariableDiscount> variableDiscountCollection;
    @JoinColumn(name = "Initial_TasktaskDetailsId", referencedColumnName = "taskDetailsId")
    @ManyToOne(optional = false)
    private InitialTask initialTasktaskDetailsId;
    @JoinColumn(name = "JobjobID", referencedColumnName = "jobId")
    @ManyToOne(optional = false)
    private Job jobjobID;
    @JoinColumn(name = "StaffstaffId", referencedColumnName = "staffId")
    @ManyToOne(optional = false)
    private Staff staffstaffId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tasktaskID")
    private Collection<Enquiry> enquiryCollection;

    public Task() {
    }

    public Task(Integer taskId) {
        this.taskId = taskId;
    }

    public Task(Integer taskId, String status, Date dateStarted) {
        this.taskId = taskId;
        this.status = status;
        this.dateStarted = dateStarted;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateStarted() {
        return dateStarted;
    }

    public void setDateStarted(Date dateStarted) {
        this.dateStarted = dateStarted;
    }

    public Date getDateCompleted() {
        return dateCompleted;
    }

    public void setDateCompleted(Date dateCompleted) {
        this.dateCompleted = dateCompleted;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getShelfOnCompletion() {
        return shelfOnCompletion;
    }

    public void setShelfOnCompletion(String shelfOnCompletion) {
        this.shelfOnCompletion = shelfOnCompletion;
    }

    @XmlTransient
    public Collection<VariableDiscount> getVariableDiscountCollection() {
        return variableDiscountCollection;
    }

    public void setVariableDiscountCollection(Collection<VariableDiscount> variableDiscountCollection) {
        this.variableDiscountCollection = variableDiscountCollection;
    }

    public InitialTask getInitialTasktaskDetailsId() {
        return initialTasktaskDetailsId;
    }

    public void setInitialTasktaskDetailsId(InitialTask initialTasktaskDetailsId) {
        this.initialTasktaskDetailsId = initialTasktaskDetailsId;
    }

    public Job getJobjobID() {
        return jobjobID;
    }

    public void setJobjobID(Job jobjobID) {
        this.jobjobID = jobjobID;
    }

    public Staff getStaffstaffId() {
        return staffstaffId;
    }

    public void setStaffstaffId(Staff staffstaffId) {
        this.staffstaffId = staffstaffId;
    }

    @XmlTransient
    public Collection<Enquiry> getEnquiryCollection() {
        return enquiryCollection;
    }

    public void setEnquiryCollection(Collection<Enquiry> enquiryCollection) {
        this.enquiryCollection = enquiryCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (taskId != null ? taskId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Task)) {
            return false;
        }
        Task other = (Task) object;
        if ((this.taskId == null && other.taskId != null) || (this.taskId != null && !this.taskId.equals(other.taskId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Task[ taskId=" + taskId + " ]";
    }
    
}
