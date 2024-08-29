/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author EWorster
 */
@Entity
public class Vertrag implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String vertragNr;
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    
    
    private String kurs;
    private String gelten;
    private Teilnehmer tn;
    
    public Vertrag(){}

    public Vertrag(String vertragNr, String kurs, String gelten) {
        this.vertragNr = vertragNr;
        this.kurs = kurs;
        this.gelten = gelten;
    }
    
    public String getGelten() {
        return gelten;
    }

    public void setGelten(String gelten) {
        this.gelten = gelten;
    }


    public String getVertragNr() {
        return vertragNr;
    }

    public void setVertragNr(String vertragNr) {
        this.vertragNr = vertragNr;
    }

    public String getKurs() {
        return kurs;
    }

    public void setKurs(String kurs) {
        this.kurs = kurs;
    }

    public Teilnehmer getTn() {
        return tn;
    }

    public void setTn(Teilnehmer tn) {
        this.tn = tn;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.vertragNr);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Vertrag other = (Vertrag) obj;
        return Objects.equals(this.vertragNr, other.vertragNr);
    }

    @Override
    public String toString() {
        return "Vertrag{" + "vertragNr=" + vertragNr + ", kurs=" + kurs + ", gelten=" + gelten + '}';
    }

}
