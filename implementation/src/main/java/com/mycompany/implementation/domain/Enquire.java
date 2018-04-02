/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "enquire")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Enquire.findAll", query = "SELECT e FROM Enquire e")
    , @NamedQuery(name = "Enquire.findByTasktaskID", query = "SELECT e FROM Enquire e WHERE e.enquirePK.tasktaskID = :tasktaskID")
    , @NamedQuery(name = "Enquire.findByEnquireNumber", query = "SELECT e FROM Enquire e WHERE e.enquirePK.enquireNumber = :enquireNumber")
    , @NamedQuery(name = "Enquire.findByInformation", query = "SELECT e FROM Enquire e WHERE e.information = :information")})
public class Enquire implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EnquirePK enquirePK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "information")
    private String information;
    @JoinColumn(name = "TasktaskID", referencedColumnName = "taskID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Task task;

    public Enquire() {
    }

    public Enquire(EnquirePK enquirePK) {
        this.enquirePK = enquirePK;
    }

    public Enquire(EnquirePK enquirePK, String information) {
        this.enquirePK = enquirePK;
        this.information = information;
    }

    public Enquire(int tasktaskID, int enquireNumber) {
        this.enquirePK = new EnquirePK(tasktaskID, enquireNumber);
    }

    public EnquirePK getEnquirePK() {
        return enquirePK;
    }

    public void setEnquirePK(EnquirePK enquirePK) {
        this.enquirePK = enquirePK;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (enquirePK != null ? enquirePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Enquire)) {
            return false;
        }
        Enquire other = (Enquire) object;
        if ((this.enquirePK == null && other.enquirePK != null) || (this.enquirePK != null && !this.enquirePK.equals(other.enquirePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Enquire[ enquirePK=" + enquirePK + " ]";
    }
    
}
