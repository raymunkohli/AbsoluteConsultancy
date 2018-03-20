/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author raymun
 */
@Embeddable
public class EnquirePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "TasktaskID")
    private int tasktaskID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "enquireNumber")
    private int enquireNumber;

    public EnquirePK() {
    }

    public EnquirePK(int tasktaskID, int enquireNumber) {
        this.tasktaskID = tasktaskID;
        this.enquireNumber = enquireNumber;
    }

    public int getTasktaskID() {
        return tasktaskID;
    }

    public void setTasktaskID(int tasktaskID) {
        this.tasktaskID = tasktaskID;
    }

    public int getEnquireNumber() {
        return enquireNumber;
    }

    public void setEnquireNumber(int enquireNumber) {
        this.enquireNumber = enquireNumber;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) tasktaskID;
        hash += (int) enquireNumber;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnquirePK)) {
            return false;
        }
        EnquirePK other = (EnquirePK) object;
        if (this.tasktaskID != other.tasktaskID) {
            return false;
        }
        if (this.enquireNumber != other.enquireNumber) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.EnquirePK[ tasktaskID=" + tasktaskID + ", enquireNumber=" + enquireNumber + " ]";
    }
    
}
