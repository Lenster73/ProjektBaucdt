/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "raum")
public class Raum implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id 
    @Column(name = "rid")
    private int rid;
    //@GeneratedValue(strategy = GenerationType.AUTO)
   
    private String raumNr;
    private String platzAnz;
    
    public Raum(){}

    public Raum(int rid, String raumNr, String platzAnz) {
        this.rid = rid;
        this.raumNr = raumNr;
        this.platzAnz = platzAnz;
    }
 
    @OneToMany(mappedBy = "raum")
    private List<Termine> datList = new ArrayList<>();

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRaumNr() {
        return raumNr;
    }

    public void setRaumNr(String raumNr) {
        this.raumNr = raumNr;
    }

    public String getPlatzAnz() {
        return platzAnz;
    }

    public void setPlatzAnz(String platzAnz) {
        this.platzAnz = platzAnz;
    }

    public List<Termine> getDatList() {
        return datList;
    }

    public void setDatList(List<Termine> datList) {
        this.datList = datList;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) rid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Raum)) {
            return false;
        }
        Raum other = (Raum) object;
        if (this.rid != other.rid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Raum{" + "rid=" + rid + ", raumNr=" + raumNr + '}';
    }

   
    
}
