/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package session;

import entity.Baustein;
import entity.Dozent;
import entity.Klassen;
import entity.Raum;
import entity.Teilnehmer;

import entity.Termine;
import entity.Vertrag;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.ejb.Remote;


/**
 *
 * @author EWorster
 */
@Remote
public interface BausteinBeanRemote {

    public List<Termine> datAus();

    public List<Klassen> getKls();

    public List<Baustein> getBau();
    public List<Vertrag> getVertr();

    public List<Teilnehmer> getTN();

    public List<Raum> getRaum();

    public List<Dozent> getDoz();

    public Termine getEinBau(String datid);

    public void addDozent(Dozent doz);
     public void addVertrag(String verNr, String kurs, String gelten, String tnNr);
    public void addNeueBauDB(String bauid,  String tag, String besch, String dozId);

    public void addTnKls(String kls, String nname, String vname, String geb);
//public void addTnKlsGeschl(String kl, String nname, String vname, String geb );

    public List<String> addDatum(List<String> alltxt);

//    public void tnAusFileHinzu(String fname, String kls);
 public void tnAllesAusFileHinzu(String fname, String kls);
 public void tnEinHinzu(String tid, String gend, String tname, String vname, String str, String plz, String ort, String tel,String tmail, String geb, String gebort, String nation, String beruf, String absch, String berat, 
String jcnum, String klsid);
    public void delTn(String tnId);
    public Klassen getKlsEin(String kid);
//    public void addDatumBauDB(List<String> datum, String fname);

    public void ersetzDatumDB(String klass, String modul, String startDat, String endeDat);
//    public void addDatumModuleDB(String klass, String modul,String raum, String startDat, String endeDat);

    public int addDatumModuleDBPruf(String klass, String modul, String raum, String startDat, String endeDat);

    public String addDatumBauManyDB(List<String> datum, String fname);

//    public void addDatumDB(List<Termine> datList, String fname);
//    public void addBaustein(Baustein bau);
    public List<String> txtBauDozTagAus(String fName);

    public List<String> txtDozAus(String fName);

    public List<String> txtDatModAus(String fname);

    public void addBau(Set<Baustein> bauSet);

    public void addKl(List<Klassen> klList);

    public void addRaum(List<Raum> rList);

    public void addDoz(List<Dozent> dozList);

    public void addBauDB(Set<Baustein> bauSet);

    public List<Termine> getDatBau(String userDat);
}
