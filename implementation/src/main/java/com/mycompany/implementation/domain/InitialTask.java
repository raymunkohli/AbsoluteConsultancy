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
@Table(name = "initial_task")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InitialTask.findAll", query = "SELECT i FROM InitialTask i")
    , @NamedQuery(name = "InitialTask.findByTaskDetailsId", query = "SELECT i FROM InitialTask i WHERE i.taskDetailsId = :taskDetailsId")
    , @NamedQuery(name = "InitialTask.findByName", query = "SELECT i FROM InitialTask i WHERE i.name = :name")
    , @NamedQuery(name = "InitialTask.findByPrice", query = "SELECT i FROM InitialTask i WHERE i.price = :price")
    , @NamedQuery(name = "InitialTask.findByDescription", query = "SELECT i FROM InitialTask i WHERE i.description = :description")})
public class InitialTask implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "taskDetailsId")
    private Integer taskDetailsId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "name")
    private int name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private short price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "initialTasktaskDetailsId")
    private Collection<Task> taskCollection;

    public InitialTask() {
    }

    public InitialTask(Integer taskDetailsId) {
        this.taskDetailsId = taskDetailsId;
    }

    public InitialTask(Integer taskDetailsId, int name, short price, String description) {
        this.taskDetailsId = taskDetailsId;
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public Integer getTaskDetailsId() {
        return taskDetailsId;
    }

    public void setTaskDetailsId(Integer taskDetailsId) {
        this.taskDetailsId = taskDetailsId;
    }

    public int getName() {
        return name;
    }

    public void setName(int name) {
        this.name = name;
    }

    public short getPrice() {
        return price;
    }

    public void setPrice(short price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        hash += (taskDetailsId != null ? taskDetailsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InitialTask)) {
            return false;
        }
        InitialTask other = (InitialTask) object;
        if ((this.taskDetailsId == null && other.taskDetailsId != null) || (this.taskDetailsId != null && !this.taskDetailsId.equals(other.taskDetailsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.implementation.domain.InitialTask[ taskDetailsId=" + taskDetailsId + " ]";
    }
    
}
