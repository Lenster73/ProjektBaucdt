/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.Teilnehmer;
import entity.Termine;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
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
@Table(name = "kls")
public class Klassen implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String klassKurz;
    
    public Klassen(){}

    public Klassen(int id, String klassKurz) {
        this.id = id;
        this.klassKurz = klassKurz;
    }

    @OneToMany(mappedBy = "kls")
    private List<Termine> datList = new ArrayList<>();
    
    @OneToMany(mappedBy = "kls")
    private List<Teilnehmer> tnList = new ArrayList<>();

//    @OneToMany(mappedBy = "kls")
//    private List<Teilnehmer> tnList = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKlassKurz() {
        return klassKurz;
    }

    public void setKlassKurz(String klassKurz) {
        this.klassKurz = klassKurz;
    }

    public List<Termine> getDatList() {
        return datList;
    }

    public void setBauList(List<Termine> datList) {
        this.datList = datList;
    }

//    public List<Teilnehmer> getTnList() {
//        return tnList;
//    }
//
//    public void setTnList(List<Teilnehmer> tnList) {
//        this.tnList = tnList;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Klassen)) {
            return false;
        }
        Klassen other = (Klassen) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Klassen{" + "id=" + id + ", klassKurz=" + klassKurz + '}';
    }

    
}
