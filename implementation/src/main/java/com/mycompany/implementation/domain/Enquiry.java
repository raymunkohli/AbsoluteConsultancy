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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "enquiry")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Enquiry.findAll", query = "SELECT e FROM Enquiry e")
    , @NamedQuery(name = "Enquiry.findByEnquiryId", query = "SELECT e FROM Enquiry e WHERE e.enquiryId = :enquiryId")
    , @NamedQuery(name = "Enquiry.findBySubject", query = "SELECT e FROM Enquiry e WHERE e.subject = :subject")
    , @NamedQuery(name = "Enquiry.findByEnquiryText", query = "SELECT e FROM Enquiry e WHERE e.enquiryText = :enquiryText")
    , @NamedQuery(name = "Enquiry.findByReplies", query = "SELECT e FROM Enquiry e WHERE e.replies = :replies")})
public class Enquiry implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enquiryId")
    private Integer enquiryId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "subject")
    private String subject;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "enquiryText")
    private String enquiryText;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "replies")
    private String replies;
    @JoinColumn(name = "TasktaskID", referencedColumnName = "taskId")
    @ManyToOne(optional = false)
    private Task tasktaskID;

    public Enquiry() {
    }

    public Enquiry(Integer enquiryId) {
        this.enquiryId = enquiryId;
    }

    public Enquiry(Integer enquiryId, String subject, String enquiryText, String replies) {
        this.enquiryId = enquiryId;
        this.subject = subject;
        this.enquiryText = enquiryText;
        this.replies = replies;
    }

    public Integer getEnquiryId() {
        return enquiryId;
    }

    public void setEnquiryId(Integer enquiryId) {
        this.enquiryId = enquiryId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getEnquiryText() {
        return enquiryText;
    }

    public void setEnquiryText(String enquiryText) {
        this.enquiryText = enquiryText;
    }

    public String getReplies() {
        return replies;
    }

    public void setReplies(String replies) {
        this.replies = replies;
    }

    public Task getTasktaskID() {
        return tasktaskID;
    }

    public void setTasktaskID(Task tasktaskID) {
        this.tasktaskID = tasktaskID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (enquiryId != null ? enquiryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Enquiry)) {
            return false;
        }
        Enquiry other = (Enquiry) object;
        if ((this.enquiryId == null && other.enquiryId != null) || (this.enquiryId != null && !this.enquiryId.equals(other.enquiryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Enquiry[ enquiryId=" + enquiryId + " ]";
    }
    
}
