/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;

import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.Id;
import javax.persistence.JoinColumn;


import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "dat")

public class Termine implements Serializable {

    private static final long serialVersionUID = 1L;
     @Column
     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="dat_gen")
//    @SequenceGenerator(name="dat_gen", sequenceName="dat_seq", allocationSize=1, initialValue=5)
  
    private String startBau;

    private String endeBau;
   

    @ManyToOne
    @JoinColumn(name = "klid")
    private Klassen kls;

    @ManyToOne
    @JoinColumn(name = "bauid")
    private Baustein bau;
    
    @ManyToOne
    @JoinColumn(name = "rid")
    private Raum raum;

//    @OneToMany(mappedBy = "dat")
//    private List<Teilnehmer> tnList = new ArrayList<>();

//    @ManyToMany
//    @JoinTable(
//            joinColumns
//            = @JoinColumn(name = "111",
//                    referencedColumnName = "id"),
//            inverseJoinColumns
//            = @JoinColumn(name = "222",
//                    referencedColumnName = "bauid"))
//    private List<Baustein> bauList = new ArrayList();
    public Termine() {
    }

    public Termine( String startBau, String endeBau) {
//        this.id = id;
        this.startBau = startBau;
        this.endeBau = endeBau;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Klassen getKls() {
        return kls;
    }

    public void setKls(Klassen kls) {
        this.kls = kls;
    }

    public Raum getRaum() {
        return raum;
    }

    public void setRaum(Raum raum) {
        this.raum = raum;
    }


//    public String getKlskurz() {
//        return klskurz;
//    }
//
//    public void setKlskurz(String klskurz) {
//        this.klskurz = klskurz;
//    }

    public String getStartBau() {
        return startBau;
    }

    public void setStartBau(String startBau) {
        this.startBau = startBau;
    }

    public String getEndeBau() {
        return endeBau;
    }

    public void setEndeBau(String endeBau) {
        this.endeBau = endeBau;
    }

    public Baustein getBau() {
        return bau;
    }

    public void setBau(Baustein bau) {
        this.bau = bau;
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
        int hash = 7;
        hash = 41 * hash + this.id;
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Termine)) {
            return false;
        }
        Termine other = (Termine) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Termine{" + "id=" + id + ", klskurz="  + ", startBau=" + startBau + ", endeBau=" + endeBau + '}';
    }

    

   

}
