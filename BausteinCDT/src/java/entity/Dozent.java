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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.persistence.Table;

/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "doz")
public class Dozent implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
//    @Column (name="dozid")
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String vnameDoz;
    private String nnameDoz;
    
    public Dozent(){}

    public Dozent(int id, String vnameDoz, String nnameDoz) {
        this.id = id;
        this.vnameDoz = vnameDoz;
        this.nnameDoz = nnameDoz;
    }
    
    

//    @ManyToMany
//    @JoinTable(
//            joinColumns
//            = @JoinColumn(name = "444",
//                    referencedColumnName = "id"),
//            inverseJoinColumns
//            = @JoinColumn(name = "555",
//                    referencedColumnName = "bauid"))
    
    @OneToMany(mappedBy="doz")
    private List<Baustein> bauList = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Baustein> getBauList() {
        return bauList;
    }

    public void setBauList(Baustein bau) {
        bauList.add(bau);
    }

    public String getVnameDoz() {
        return vnameDoz;
    }

    public void setVnameDoz(String vnameDoz) {
        this.vnameDoz = vnameDoz;
    }

    public String getNnameDoz() {
        return nnameDoz;
    }

    public void setNnameDoz(String nnameDoz) {
        this.nnameDoz = nnameDoz;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dozent)) {
            return false;
        }
        Dozent other = (Dozent) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dozent{" + "id=" + id + ", vnameDoz=" + vnameDoz + ", nnameDoz=" + nnameDoz + '}';
    }
}
