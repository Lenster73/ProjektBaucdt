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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "bau")
public class Baustein implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "bauid")
    private String bauid;
    //@GeneratedValue(strategy = GenerationType.IDENTITY)

    private String bauBeschr;
    private int bauTage;

    public Baustein() {
    }

    public Baustein(String bauid, String bauBeschr, int bauTage) {
        this.bauid = bauid;
        this.bauBeschr = bauBeschr;
        this.bauTage= bauTage;
    }
    
    public Baustein(String bauid, String bauBeschr) {
        this.bauid = bauid;
        this.bauBeschr = bauBeschr;
    }

    @ManyToOne
    @JoinColumn(name = "dozid")
    private Dozent doz;

    @OneToMany(mappedBy = "bau")
    private List<Termine> bauList = new ArrayList<>();

//    @ManyToOne 
//    @JoinColumn(name="klid")
//    private Klassen kls;
//    @ManyToMany(mappedBy = "bauList")
//    List<Termine> datList= new ArrayList();
//    public Klassen getKls() {
//        return kls;
//    }
//
//    public void setKls(Klassen kls) {
//        this.kls = kls;
//    }
    public Dozent getDoz() {
        return doz;
    }

    public void setDoz(Dozent doz) {
        this.doz = doz;
    }

    public int getBauTage() {
        return bauTage;
    }

    public void setBauTage(int bauTage) {
        this.bauTage = bauTage;
    }
    
    

    public String getBauid() {
        return bauid;
    }

    public void setBauid(String bauid) {
        this.bauid = bauid;
    }

    public List<Termine> getBauList() {
        return bauList;
    }

    public void setBauList(List<Termine> bauList) {
        this.bauList = bauList;
    }

//    public List<Termine> getDatList() {
//        return datList;
//    }
//
//    public void setDatList(List<Termine> datList) {
//        this.datList = datList;
//    }
    public String getBauBeschr() {
        return bauBeschr;
    }

    public void setBauBeschr(String bauBeschr) {
        this.bauBeschr = bauBeschr;
    }

    @Override
    public int hashCode() {

        return Objects.hash(bauid, bauBeschr);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Baustein bau = (Baustein) obj;

        return Objects.equals(bauid, bau.bauid)
                && Objects.equals(bauBeschr, bau.bauBeschr);
    }

//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (bauid != null ? bauid.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof Baustein)) {
//            return false;
//        }
//        Baustein other = (Baustein) object;
//        if ((this.bauid == null && other.bauid != null) || (this.bauid != null && !this.bauid.equals(other.bauid))) {
//            return false;
//        }
//        return true;
//    }
    @Override
    public String toString() {
        return "Baustein{" + "bauid=" + bauid + ", bauBeschr=" + bauBeschr + '}';
    }

}
