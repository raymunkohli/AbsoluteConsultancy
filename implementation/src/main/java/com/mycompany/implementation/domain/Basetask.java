/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.domain;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "basetask")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Basetask.findAll", query = "SELECT b FROM Basetask b")
    , @NamedQuery(name = "Basetask.findByTaskName", query = "SELECT b FROM Basetask b WHERE b.taskName = :taskName")
    , @NamedQuery(name = "Basetask.findByDepartment", query = "SELECT b FROM Basetask b WHERE b.department = :department")
    , @NamedQuery(name = "Basetask.findByDescription", query = "SELECT b FROM Basetask b WHERE b.description = :description")
    , @NamedQuery(name = "Basetask.findByPrice", query = "SELECT b FROM Basetask b WHERE b.price = :price")
    , @NamedQuery(name = "Basetask.findByBaseTaskID", query = "SELECT b FROM Basetask b WHERE b.baseTaskID = :baseTaskID")})
public class Basetask implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "duration")
    private int duration;

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "taskName")
    private String taskName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "department")
    private String department;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private double price;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "baseTaskID")
    private Integer baseTaskID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "baseTaskbaseTaskID")
    private Collection<Task> taskCollection;

    public Basetask() {
    }

    public Basetask(Integer baseTaskID) {
        this.baseTaskID = baseTaskID;
    }

    public Basetask(Integer baseTaskID, String taskName, String department, String description, double price) {
        this.baseTaskID = baseTaskID;
        this.taskName = taskName;
        this.department = department;
        this.description = description;
        this.price = price;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getBaseTaskID() {
        return baseTaskID;
    }

    public void setBaseTaskID(Integer baseTaskID) {
        this.baseTaskID = baseTaskID;
    }

    @XmlTransient
    public Collection<Task> getTaskCollection() {
        return taskCollection;
    }

    public void setTaskCollection(Collection<Task> taskCollection) {
        this.taskCollection = taskCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (baseTaskID != null ? baseTaskID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Basetask)) {
            return false;
        }
        Basetask other = (Basetask) object;
        if ((this.baseTaskID == null && other.baseTaskID != null) || (this.baseTaskID != null && !this.baseTaskID.equals(other.baseTaskID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.Basetask[ baseTaskID=" + baseTaskID + " ]";
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    
}
