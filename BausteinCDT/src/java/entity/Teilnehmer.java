/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import service.Gender;


/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "tn")

public class Teilnehmer implements Serializable {
    
     private static final long serialVersionUID = 1L;
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
//    private int tnid;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    
    private String tnNname;
    private String tnVname;
    
    private String tnStrNr;
    private String tnPlz;
    private String tnOrt;
    private String tnTelNr;
    private String tnEmail;
    private String tnGeb;
    private String tnGebort;
    
    private String tnNation;
    private String tnBeruf;
    private String tnAbschluss;
    private String tnBerater;
    private String tnJCNummer; 
    
    private String ist;
   
//    @ManyToOne 
//    @JoinColumn(name="datid")
//    private Termine dat;
    
    @ManyToOne 
    @JoinColumn(name="klid")
    private Klassen kls;
    
    public Teilnehmer(){}

    public Teilnehmer(int id, Gender gender, String tnNname, String tnVname, String tnStrNr, String tnPlz, String tnOrt,
            String tnTelNr, String tnEmail, String tnGeb, String tnGebort, String tnNation, String tnBeruf, String tnAbschluss,
            String tnBerater, String tnJCNummer, String ist) {
        this.id = id;
        this.gender = gender;
        this.tnNname = tnNname;
        this.tnVname = tnVname;
        this.tnStrNr = tnStrNr;
        this.tnPlz = tnPlz;
        this.tnOrt = tnOrt;
        this.tnTelNr = tnTelNr;
        this.tnEmail = tnEmail;
        this.tnGeb = tnGeb;
        this.tnGebort = tnGebort;
        this.tnNation = tnNation;
        this.tnBeruf = tnBeruf;
        this.tnAbschluss = tnAbschluss;
        this.tnBerater = tnBerater;
        this.tnJCNummer = tnJCNummer;
        this.ist = ist;
    }
    
     public Teilnehmer(String tnNname, String tnVname, String tnGeb, String ist) {
        this.tnNname = tnNname;
        this.tnVname = tnVname;
        this.tnGeb = tnGeb;
        this.ist=ist;
    }
//    public Teilnehmer(String tnNname, String tnVname, String tnGeb) {
//        this.tnNname = tnNname;
//        this.tnVname = tnVname;
//        this.tnGeb = tnGeb;
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
    
    public String getTnVname() {
        return tnVname;
    }

    public void setTnVname(String tnVname) {
        this.tnVname = tnVname;
    }

    public String getTnNname() {
        return tnNname;
    }

    public void setTnNname(String tnNname) {
        this.tnNname = tnNname;
    }

    public String getTnGeb() {
        return tnGeb;
    }

    public void setTnGeb(String tnGeb) {
        this.tnGeb = tnGeb;
    }

    public String isIst() {
        return ist;
    }

    public void setIst(String ist) {
        this.ist = ist;
    }

    public String getTnStrNr() {
        return tnStrNr;
    }

    public void setTnStrNr(String tnStrNr) {
        this.tnStrNr = tnStrNr;
    }

    public String getTnPlz() {
        return tnPlz;
    }

    public void setTnPlz(String tnPlz) {
        this.tnPlz = tnPlz;
    }

    public String getTnOrt() {
        return tnOrt;
    }

    public void setTnOrt(String tnOrt) {
        this.tnOrt = tnOrt;
    }

    public String getTnTelNr() {
        return tnTelNr;
    }

    public void setTnTelNr(String tnTelNr) {
        this.tnTelNr = tnTelNr;
    }

    public String getTnEmail() {
        return tnEmail;
    }

    public void setTnEmail(String tnEmail) {
        this.tnEmail = tnEmail;
    }

    public String getTnGebort() {
        return tnGebort;
    }

    public void setTnGebort(String tnGebort) {
        this.tnGebort = tnGebort;
    }

    public String getTnNation() {
        return tnNation;
    }

    public void setTnNation(String tnNation) {
        this.tnNation = tnNation;
    }

    public String getTnBeruf() {
        return tnBeruf;
    }

    public void setTnBeruf(String tnBeruf) {
        this.tnBeruf = tnBeruf;
    }

    public String getTnAbschluss() {
        return tnAbschluss;
    }

    public void setTnAbschluss(String tnAbschluss) {
        this.tnAbschluss = tnAbschluss;
    }

    public String getTnBerater() {
        return tnBerater;
    }

    public void setTnBerater(String tnBerater) {
        this.tnBerater = tnBerater;
    }

    public String getTnJCNummer() {
        return tnJCNummer;
    }

    public void setTnJCNummer(String tnJCNummer) {
        this.tnJCNummer = tnJCNummer;
    }
    
    

    public Klassen getKls() {
        return kls;
    }

    public void setKls(Klassen kls) {
        this.kls = kls;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Teilnehmer)) {
            return false;
        }
        Teilnehmer other = (Teilnehmer) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Teilnehmer{" + "id=" + id + ", tnVname=" + tnVname + ", tnNname=" + tnNname + ", tnGeb=" + tnGeb + '}';
    }

    
    
}