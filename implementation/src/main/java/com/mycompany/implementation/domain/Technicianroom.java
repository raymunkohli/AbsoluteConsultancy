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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "technicianroom")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Technicianroom.findAll", query = "SELECT t FROM Technicianroom t")
    , @NamedQuery(name = "Technicianroom.findByStaffstaffID", query = "SELECT t FROM Technicianroom t WHERE t.staffstaffID = :staffstaffID")
    , @NamedQuery(name = "Technicianroom.findByTechnicianroom", query = "SELECT t FROM Technicianroom t WHERE t.technicianroom = :technicianroom")})
public class Technicianroom implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "staff_staffID")
    private Integer staffstaffID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "technicianroom")
    private String technicianroom;
    @JoinColumn(name = "staff_staffID", referencedColumnName = "staffID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Staff staff;

    public Technicianroom() {
    }

    public Technicianroom(Integer staffstaffID) {
        this.staffstaffID = staffstaffID;
    }

    public Technicianroom(Integer staffstaffID, String technicianroom) {
        this.staffstaffID = staffstaffID;
        this.technicianroom = technicianroom;
    }

    public Integer getStaffstaffID() {
        return staffstaffID;
    }

    public void setStaffstaffID(Integer staffstaffID) {
        this.staffstaffID = staffstaffID;
    }

    public String getTechnicianroom() {
        return technicianroom;
    }

    public void setTechnicianroom(String technicianroom) {
        this.technicianroom = technicianroom;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffstaffID != null ? staffstaffID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Technicianroom)) {
            return false;
        }
        Technicianroom other = (Technicianroom) object;
        if ((this.staffstaffID == null && other.staffstaffID != null) || (this.staffstaffID != null && !this.staffstaffID.equals(other.staffstaffID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Technicianroom[ staffstaffID=" + staffstaffID + " ]";
    }
    
}
