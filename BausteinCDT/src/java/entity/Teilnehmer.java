/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author EWorster
 */
@Entity
@Table(name = "tn")
public class Teilnehmer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String tnNname;
    private String tnVname;
    private String tnGeb;
    
//    @ManyToOne 
//    @JoinColumn(name="datid")
//    private Termine dat;
    
    @ManyToOne 
    @JoinColumn(name="klid")
    private Klassen kls;
    
    public Teilnehmer(){}

    public Teilnehmer( String tnNname,String tnVname, String tnGeb) {
//        this.id = id;
        this.tnVname = tnVname;
        this.tnNname = tnNname;
        this.tnGeb = tnGeb;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

//    public Termine getDat() {
//        return dat;
//    }
//
//    public void setDat(Termine dat) {
//        this.dat = dat;
//    }


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
