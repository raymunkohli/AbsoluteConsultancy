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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author raymun
 */
@Entity
@Table(name = "band")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Band.findAll", query = "SELECT b FROM Band b")
    , @NamedQuery(name = "Band.findByBandID", query = "SELECT b FROM Band b WHERE b.bandID = :bandID")
    , @NamedQuery(name = "Band.findByLowerBound", query = "SELECT b FROM Band b WHERE b.lowerBound = :lowerBound")
    , @NamedQuery(name = "Band.findByUpperBound", query = "SELECT b FROM Band b WHERE b.upperBound = :upperBound")
    , @NamedQuery(name = "Band.findByDiscount", query = "SELECT b FROM Band b WHERE b.discount = :discount")})
public class Band implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "BandID")
    private Integer bandID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lowerBound")
    private double lowerBound;
    @Basic(optional = false)
    @NotNull
    @Column(name = "upperBound")
    private double upperBound;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discount")
    private double discount;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bandBandID")
    private Collection<Flexiblediscount> flexiblediscountCollection;

    public Band() {
    }

    public Band(Integer bandID) {
        this.bandID = bandID;
    }

    public Band(Integer bandID, double lowerBound, double upperBound, double discount) {
        this.bandID = bandID;
        this.lowerBound = lowerBound;
        this.upperBound = upperBound;
        this.discount = discount;
    }

    public Integer getBandID() {
        return bandID;
    }

    public void setBandID(Integer bandID) {
        this.bandID = bandID;
    }

    public double getLowerBound() {
        return lowerBound;
    }

    public void setLowerBound(double lowerBound) {
        this.lowerBound = lowerBound;
    }

    public double getUpperBound() {
        return upperBound;
    }

    public void setUpperBound(double upperBound) {
        this.upperBound = upperBound;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @XmlTransient
    public Collection<Flexiblediscount> getFlexiblediscountCollection() {
        return flexiblediscountCollection;
    }

    public void setFlexiblediscountCollection(Collection<Flexiblediscount> flexiblediscountCollection) {
        this.flexiblediscountCollection = flexiblediscountCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bandID != null ? bandID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Band)) {
            return false;
        }
        Band other = (Band) object;
        if ((this.bandID == null && other.bandID != null) || (this.bandID != null && !this.bandID.equals(other.bandID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "domain.Band[ bandID=" + bandID + " ]";
    }
    
}
