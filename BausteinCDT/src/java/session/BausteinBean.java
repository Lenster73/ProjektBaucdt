/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatefulEjbClass.java to edit this template
 */
package session;

import entity.Baustein;
import entity.Dozent;

import entity.Klassen;
import entity.Raum;
import entity.Teilnehmer;
import entity.Termine;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import jdk.nashorn.internal.runtime.regexp.RegExp;
import service.BauService;
import service.Gender;


/**
 *
 * @author EWorster
 */
@Stateful
public class BausteinBean implements BausteinBeanRemote {

    @PersistenceContext(unitName = "BausteinCDTPU")
    private EntityManager em;

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    @Override
    public void addDozent(Dozent doz) {
        try {
            em.persist(doz);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
      public void addTnKls(String kl, String nname, String vname, String geb ) {
        try {
            Klassen kls=(Klassen) em.createQuery("From Klassen Where klassKurz = '" + kl + "'").getSingleResult();
            String ist="y";
            Teilnehmer tn= new Teilnehmer(nname, vname, geb, ist);
            tn.setKls(kls);
            if(tn!= null){
            em.persist(tn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
      
//       @Override
//      public void addTnKlsGeschl(String kl, String nname, String vname, String geb ) {
//        try {
//            Klassen kls=(Klassen) em.createQuery("From Klassen Where klassKurz = '" + kl + "'").getSingleResult();
//            Teilnehmer tn= new Teilnehmer(nname, vname, geb, geschl);
//            //tn.setTnGeschlecht(geschl);
//            tn.setKls(kls);
//            if(tn!= null){
//            em.persist(tn);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    public List<String> addDatum(List<String> alltxt) {
        List<String> datum = new ArrayList<>();

        for (int i = 0; i < (alltxt.size() - 2); i += 3) {
            //int minus = datum.indexOf('-');
            datum.add(alltxt.get(i));
            datum.add(alltxt.get(i + 1));
        }
        return datum;
    }


//!!!!!GUT FUNKTIONIRT VON CHATGPT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
//    @Override
//public String addDatumBauManyDB(List<String> datum, String klname) {
//    String start, ende, baudat, antw = "";
//    boolean gibt = false;
//    //int j = 0;
//    //Raum rm = new Raum();
//    try {
//        // Fetch the class object
//        Klassen kl = (Klassen) em.createQuery("FROM Klassen WHERE klassKurz = :klname", Klassen.class)
//                                .setParameter("klname", klname)
//                                .getSingleResult();
//
//        // Check if a Termine entry already exists for the class
//        gibt = em.createQuery("SELECT COUNT(t) FROM Termine t WHERE t.kls.klassKurz = :klname", Long.class)
//                 .setParameter("klname", klname)
//                 .getSingleResult() > 0;
//
//        if (gibt) {
//            return "Diese Klasse gibt es schon";
//        }
//
//        // Find the next ID (assuming j is an ID based on the list size)
//        //j = em.createQuery("SELECT COUNT(t) FROM Termine t", Long.class)
//              //.getSingleResult().intValue() + 1;
//
//        for (int i = 0; i < datum.size() - 1; i += 2) {
//            int minus = datum.get(i).indexOf('-');
//            if (minus == -1) {
//                throw new IllegalArgumentException("Invalid date range format: " + datum.get(i));
//            }
//
//            start = datum.get(i).substring(0, minus).trim();
//            ende = datum.get(i).substring(minus + 1).trim();
//            baudat = datum.get(i + 1);
//
//            // Fetch the Baustein object
//            Baustein bau = em.createQuery("FROM Baustein WHERE bauid = :baudat", Baustein.class)
//                             .setParameter("baudat", baudat)
//                             .getSingleResult();
//
//            // Create and persist the Termine object
//            Termine dat = new Termine(start, ende);
//            dat.setKls(kl);
//            dat.setBau(bau);
//            //dat.setRaum(rm);
//            em.persist(dat);
//
//            //j++;
//        }
//    } catch (Exception e) {
//        e.printStackTrace();
//        return "An error occurred: " + e.getMessage();
//    }
//
//    return antw;
//}


    
    @Override
    public String addDatumBauManyDB(List<String> datum, String klname) {
        String start, ende, baudat, antw = "";
        boolean gibt=false;
        //Raum rm = new Raum();
        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + klname + "'").getSingleResult();
        try {
            List<Termine> datList = em.createQuery("From Termine").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table            
            
            for (int i = 0; i < datList.size(); i++) {
                if (datList.get(i).getKls().getKlassKurz().equalsIgnoreCase(klname)) {
                    i = datList.size();
                    antw = "diese Klasse gibt es schon";
                    gibt=true;
                }
            }
            if(!gibt){
                
            for (int i = 0; i < datum.size() - 1; i += 2) {
            int minus = datum.get(i).indexOf('-');
            start = datum.get(i).substring(0, minus).trim();
            ende = datum.get(i).substring(minus + 1).trim();
            baudat = datum.get(i + 1); 
                Baustein bau = (Baustein) em.createQuery("From Baustein Where bauid = '" + baudat + "'").getSingleResult();

                Termine dat = new Termine(start, ende);
                dat.setKls(kl);
                dat.setBau(bau);
                //dat.setRaum(rm); 
                em.persist(dat);
            }
            }
            } catch (Exception e) {
                e.printStackTrace();
            } 
        return antw;
    }

    @Override
    public void tnAllesAusFileHinzu(String fname, String kls) {
        List<String> alltxt = Arrays.asList();
        String fNam = fname;
        List<Teilnehmer> tnList = new ArrayList<>();
        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + kls + "'").getSingleResult();
        try (FileReader reader = new FileReader("C://EJB//BauPlanungCDT/Datei/" + fNam); BufferedReader br = new BufferedReader(reader)) {
            alltxt = br.lines().flatMap(line -> Stream.of(line.split(";", 16))) /*("\\s+")))*/
                    .collect(Collectors.toList());
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (int i = 16; i <= (alltxt.size() - 16); i += 16) {
            int tnid= Integer.parseInt(alltxt.get(i));
            String gend= alltxt.get(i + 1);
            String nname = alltxt.get(i + 2);
            String vname = alltxt.get(i + 3);
            String str=alltxt.get(i + 4);
            String plz=alltxt.get(i + 5);
            String ort=alltxt.get(i + 6);
            String tel=alltxt.get(i + 7);
            String email=alltxt.get(i + 8);
            String geb = alltxt.get(i + 9);
            String gebort=alltxt.get(i + 10);
            String nation=alltxt.get(i + 11);
            String beruf=alltxt.get(i + 12);
            String abschl=alltxt.get(i + 13);
            String berater=alltxt.get(i + 14);
            String jcnr=alltxt.get(i + 15);
            Gender gendTN=Gender.WEIBLICH;
            switch (gend) {
                case "w":
                   gendTN = Gender.WEIBLICH;
                    break;
                case "m":
                    gendTN = Gender.MAENLICH;
                    break;
                case "d":
                    gendTN = Gender.DIVERS;
                    break;
            }
            Teilnehmer tn = new Teilnehmer(tnid, gendTN, nname, vname,str, plz, ort,tel, email, geb,gebort,nation, beruf, abschl, berater,jcnr, "y");
            tn.setKls(kl);
            tnList.add(tn);            
        }

        for (int i = 0; i < tnList.size(); i++) {
            Teilnehmer tn = tnList.get(i);
            int tnid=tnList.get(i).getId();
            tn.setKls(kl);
            try {
                Teilnehmer tnSuch = em.find(Teilnehmer.class, tnid );
                if (tnSuch == null || tnSuch.getKls() != kl) {
                    em.persist(tn);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public Klassen getKlsEin(String kid){
       Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + kid + "'").getSingleResult();
       return kl;
    }
    
    @Override
    public void tnEinHinzu(String tid, String gend, String tname, String vname, String str, String plz, String ort, String tel, String tmail, String geb, String gebort, String nation, String beruf, String absch, String berat,String jcnum, String klsid) {
        Klassen kl= new Klassen();
        if(klsid.equalsIgnoreCase("-1")){
            kl=new Klassen();
        } else{
        kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + klsid + "'").getSingleResult();
        }
        int tnid = 0;
        try {
            tnid = Integer.parseInt(tid);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            
        }
        Gender gendTN;
        switch (gend) {
            case "w":
                gendTN = Gender.WEIBLICH;
                break;
            case "m":
                gendTN = Gender.MAENLICH;
                break;
            case "d":
                gendTN = Gender.DIVERS;
                break;
            default:
                gendTN = Gender.WEIBLICH; // or handle default case differently
        }
        if (tnid != 0) {
            Teilnehmer tn = new Teilnehmer(tnid, gendTN, tname, vname, str, plz, ort,
                    tel, tmail, geb, gebort, nation, beruf, absch, berat, jcnum, "y");
            tn.setKls(kl);
            try {
                em.persist(tn);
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
    }
    


//    @Override
//    public void tnAusFileHinzu(String fname, String kls) {
//        List<String> alltxt = Arrays.asList();
//        String fNam = fname;
//        List<Teilnehmer> tnList = new ArrayList<>();
//        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + kls + "'").getSingleResult();
//        try (FileReader reader = new FileReader("C://EJB//BauPlanungCDT/Datei/" + fNam); BufferedReader br = new BufferedReader(reader)) {
//            alltxt = br.lines().flatMap(line -> Stream.of(line.split(";", 4))) /*("\\s+")))*/
//                    .collect(Collectors.toList());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        for (int i = 4; i <= (alltxt.size() - 4); i += 4) {
//            String nname = alltxt.get(i + 1);
//            String vname = alltxt.get(i + 2);
//            String geb = alltxt.get(i + 3);
//            Teilnehmer tn = new Teilnehmer(nname, vname, geb, "y");
//            tn.setKls(kl);
//            tnList.add(tn);
//        }
//
//        for (int i = 0; i < tnList.size(); i++) {
//            Teilnehmer tn = new Teilnehmer(tnList.get(i).getTnNname(), tnList.get(i).getTnVname(), tnList.get(i).getTnGeb(),"y");
//            tn.setKls(kl);
//            try {
//                Teilnehmer tnSuch = em.find(Teilnehmer.class, i + 1);
//                if (tnSuch == null || tnSuch.getKls() != kl) {
//                    em.persist(tn);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }
    
    @Override
    public int addDatumModuleDBPruf(String klass, String modul, String raum, String startDat, String endeDat) {
        Termine dat = new Termine();
        List<Termine> datList = new ArrayList<>();
        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + klass + "'").getSingleResult();
        Raum r = (Raum) em.createQuery("From Raum Where raumNr = '" + raum + "'").getSingleResult();
        Baustein bau = (Baustein) em.createQuery("From Baustein Where bauid = '" + modul + "'").getSingleResult();
        int j = 0, g='y';
        try {
            datList = em.createQuery("From Termine").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table            
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        try {
            LocalDate dateS = LocalDate.parse(startDat, inputFormat);
            LocalDate dateE = LocalDate.parse(endeDat, inputFormat);
            String startD = outputFormat.format(dateS);
            String endD = outputFormat.format(dateE);
       
            for (int i = 0; i < datList.size(); i++) {
                String endAusDB=datList.get(i).getEndeBau();
                String startAusDB=datList.get(i).getStartBau();
                LocalDate dateEndDB=LocalDate.parse(endAusDB, outputFormat);
                LocalDate dateStartDB=LocalDate.parse(startAusDB,outputFormat);
                if (dateS.isBefore(dateEndDB)& dateS.isAfter(dateStartDB)){
                    g='n';
                } 
            }
            for (int i = 0; i < datList.size(); i++) {
                if (datList.get(i).getStartBau().equalsIgnoreCase(startD) & datList.get(i).getEndeBau().equalsIgnoreCase(endD)
                        & datList.get(i).getBau() == bau & datList.get(i).getKls()==kl) {
                    j = 5;
                    i = datList.size();
                }
            }
            if (j == 0 & g!='n') {
                dat = new Termine(startD, endD);
                dat.setBau(bau);
                dat.setKls(kl);
                dat.setRaum(r);
                em.persist(dat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return g;
    }

//    @Override
//    public void addDatumModuleDB(String klass, String modul,String raum, String startDat, String endeDat) {
//        Termine dat = new Termine();
//        List<Termine> datList = new ArrayList<>();
//        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + klass + "'").getSingleResult();
//        Raum r = (Raum) em.createQuery("From Raum Where raumNr = '" + raum + "'").getSingleResult();
//        Baustein bau = (Baustein) em.createQuery("From Baustein Where bauid = '" + modul + "'").getSingleResult();
//        int j = 0;
//        try {
//            datList = em.createQuery("From Termine").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");
//        try {
//            Date dateS = inputFormat.parse(startDat);
//            Date dateE = inputFormat.parse(endeDat);
//            String startD = outputFormat.format(dateS);
//            String endD = outputFormat.format(dateE);
//       
//            for (int i = 0; i < datList.size(); i++) {
//                if (datList.get(i).getStartBau() == startD & datList.get(i).getEndeBau() == endD
//                        & datList.get(i).getBau() == bau & datList.get(i).getKls()==kl) {
//                    j = 5;
//                    i = datList.size();
//                }
//            }
//            if (j == 0) {
//                dat = new Termine(startD, endD);
//                dat.setBau(bau);
//                dat.setKls(kl);
//                dat.setRaum(r);
//                em.persist(dat);
//            }
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    public void ersetzDatumDB(String klass, String modul, String startDat, String endeDat) {
        Termine dat = new Termine();
        List<Termine> datList = new ArrayList<>();
        Klassen kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + klass + "'").getSingleResult();
        Baustein bau = (Baustein) em.createQuery("From Baustein Where bauid = '" + modul + "'").getSingleResult();
        int j = 0;
        try {
            datList = em.createQuery("From Termine").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table            
        } catch (Exception e) {
            e.printStackTrace();
        }
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");
        for (int i = 0; i < datList.size(); i++) {
            if (datList.get(i).getBau() == bau && datList.get(i).getKls() == kl) {
                //dat = datList.get(i);
                try {
                    Date dateS = inputFormat.parse(startDat);
                    Date dateE = inputFormat.parse(endeDat);
                    String startD = outputFormat.format(dateS);
                    String endD = outputFormat.format(dateE);
                    datList.get(i).setStartBau(startD);
                    datList.get(i).setEndeBau(endD);
                    dat=datList.get(i);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                i = datList.size();
            }
        }
        if (dat != null) {
            em.merge(dat);
        }
    }

//    @Override
//    public void addDatumBauDB(List<String> datum, String fname) {
//        String start, ende, baudat;
//        Termine dat = new Termine();
//        Klassen kl = new Klassen();
//        Baustein bau = new Baustein();
//        kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + fname + "'").getSingleResult();
//
//        int j = 0;
//        for (int i = 0; i < datum.size() - 1; i += 2) {
//            int minus = datum.get(i).indexOf('-');
//            start = datum.get(i).substring(0, minus).trim();
//            ende = datum.get(i).substring(minus + 1).trim();
//            baudat = datum.get(i + 1);
//            dat = new Termine(start, ende);
//            dat.setKls(kl);
//            bau = (Baustein) em.createQuery("From Baustein Where bauid = '" + baudat + "'").getSingleResult();
//            dat.setBau(bau);
//            Termine datSuch = em.find(Termine.class, j);
//            if (datSuch == null) {
//                em.persist(dat);
//            }
//            j++;
//        }
//    }

//    @Override
//    public void addDatumDB(List<Termine> datList, String fname) {
//        Termine dat = new Termine();
//        Klassen kl = new Klassen();
//
//        kl = (Klassen) em.createQuery("From Klassen Where klassKurz = '" + fname + "'").getSingleResult();
//        for (int i = 0; i < datList.size(); i++) {
//            dat = new Termine(datList.get(i).getStartBau(), datList.get(i).getEndeBau());
//            Termine datSuch = em.find(Termine.class,
//                    i);
//            if (datSuch == null) {
//                em.persist(dat);
//            }
//        }
//    }
    
     @Override
    public List<String> txtBauDozTagAus(String fName) {
        List<String> alltxt = Arrays.asList();
        String bBesch = "", fNam = fName;

        try (FileReader reader = new FileReader("C://EJB//BauPlanungCDT/" + fNam); BufferedReader br = new BufferedReader(reader)) {
            alltxt = br.lines().flatMap(line -> Stream.of(line.split(";", 4))) /*("\\s+")))*/
                    .collect(Collectors.toList());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return alltxt;
    }


    @Override
    public List<String> txtDozAus(String fname) {
        List<String> alltxt = null;
        //List<Baustein> bauList= new ArrayList();
        try (FileReader reader = new FileReader("C://EJB//BauPlanungCDT/" + fname); BufferedReader br = new BufferedReader(reader)) {
            alltxt = br.lines().flatMap(line -> Stream.of(line.split(";", 2)))
                    .collect(Collectors.toList());
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return alltxt;
    }

    @Override
    public void addDoz(List<Dozent> dozList) {
        Dozent doz = new Dozent();

        for (int i = 0; i < dozList.size(); i++) {
            int idDoz = dozList.get(i).getId();
            String vname = dozList.get(i).getVnameDoz();
            String nname = dozList.get(i).getNnameDoz();
            doz = new Dozent(idDoz, vname, nname);
            Dozent dozSuch = em.find(Dozent.class,
                    i);
            if (dozSuch == null) {
                em.persist(doz);
            }
        }
    }

    @Override
    public void addKl(List<Klassen> klList) {
        Klassen kl = new Klassen();

        for (int i = 0; i < klList.size(); i++) {
            int idkl = klList.get(i).getId();
            String klname = klList.get(i).getKlassKurz();
            kl = new Klassen(idkl, klname);
            Klassen klSuch = em.find(Klassen.class,
                    i);
            if (klSuch == null) {
                em.persist(kl);
            }
        }
    }
    
     @Override
    public void addRaum(List<Raum> rList) {
        Raum raum = new Raum();

        for (int i = 0; i < rList.size(); i++) {
            int idr = rList.get(i).getRid();
            String rNum =rList.get(i).getRaumNr();
            String platz =rList.get(i).getPlatzAnz();
            Raum klSuch = em.find(Raum.class,
                    idr);
            if (klSuch == null) {
                em.persist(new Raum(idr, rNum, platz));
            }
        }
    }

    @Override
    public void addBau(Set<Baustein> bauSet) {
        Baustein bau = new Baustein();
        Iterator<Baustein> iter = bauSet.iterator();
        while (iter.hasNext()) {
            bau = iter.next();
            em.persist(bau);
        }
    }
    
    @Override
    public void addNeueBauDB(String bauid,  String tag, String besch, String dozId) {
        int tagInt= Integer.parseInt(tag);
        Dozent doz= new Dozent();
        int dozIdInt= Integer.parseInt(dozId);
        if(dozIdInt >=0){
            doz=(Dozent)em.createQuery("From Dozent Where id = '" + dozIdInt + "'").getSingleResult();
        }  else{
            doz=null;
        }   
        Baustein bau= new Baustein(bauid, besch, tagInt);
        bau.setDoz(doz);
//            Baustein bauSuch = em.find(Baustein.class,
//                    bau.getBauid());
            if (bau!= null) {
                em.persist(bau);
            }
        }
    

    @Override
    public void addBauDB(Set<Baustein> bauSet) {
        Iterator<Baustein> iter = bauSet.iterator();
        while (iter.hasNext()) {
            Baustein bau = iter.next();
            Baustein bauSuch = em.find(Baustein.class,
                    bau.getBauid());
            if (bauSuch == null) {
                em.persist(bau);
            }
        }
    }

    @Override
    public List<String> txtDatModAus(String fname) {
        List<String> txtDat = null;
//        List<Baustein> bauList= new ArrayList();
        try (FileReader reader = new FileReader("C://EJB//BauPlanungCDT/" + fname); BufferedReader br = new BufferedReader(reader)) {
            txtDat = br.lines().flatMap(line -> Stream.of(line.split(" ", 3))) /*(line.split("\\s+")))*/
                    .collect(Collectors.toList());
        } catch (IOException ign) {
            ign.printStackTrace();
            System.out.println("Etwas nich geklapt");
        }
        return txtDat;
    }

    @Override
    public List<Termine> getDatBau(String userD) {
        List<Termine> datList = em.createQuery("From Termine").getResultList();
        List<String> datUseList = new ArrayList<>();
        BauService bauser = new BauService();
        Termine dat = new Termine();
        boolean gibtEs = false;
        int datid;
        String antw = "";
        DateTimeFormatter inputform = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter dbform = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        for (int i = 0; i < datList.size(); i++) {
            try {
                String startD = datList.get(i).getStartBau();
                String endD = datList.get(i).getEndeBau();
                LocalDate startDate = LocalDate.parse(startD, dbform);
                LocalDate endDate = LocalDate.parse(endD, dbform);
                LocalDate useDate = LocalDate.parse(userD, inputform);
                gibtEs = !useDate.isBefore(startDate) && !useDate.isAfter(endDate);
                if (gibtEs) {
                    datid = datList.get(i).getId();
                    dat = (Termine) em.createQuery("From Termine Where id = '" + datid + "'").getSingleResult();
                    antw = Integer.toString(dat.getId());
                    datUseList.add(antw);
                }
            } catch (Exception e) {
                e.printStackTrace();
                antw = "Fehler!!";
            }
        }
        List<Termine> datWahlList = bauser.useDatTermine(datUseList, datList);
        return datWahlList;
    }

    @Override
    public Termine getEinBau(String id) {
        try {
            int datid = Integer.parseInt(id);
            Termine dat = (Termine) em.createQuery("From Termine Where id = '" + datid + "'").getSingleResult();
            return dat;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
     @Override
    public List<Dozent> getDoz() {
        try {
            List<Dozent> dozList = em.createQuery("From Dozent").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return dozList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Klassen> getKls() {
        try {
            List<Klassen> klsList = em.createQuery("From Klassen").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return klsList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
     @Override
    public List<Raum> getRaum() {
        try {
            List<Raum> rList = em.createQuery("From Raum").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return rList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Teilnehmer> getTN() {
        try {
            List<Teilnehmer> tnList = em.createQuery("From Teilnehmer").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return tnList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Baustein> getBau() {
        try {
            List<Baustein> bauList = em.createQuery("From Baustein").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return bauList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Termine> datAus() {
        try {
            List<Termine> datList = em.createQuery("From Termine").getResultList(); //Teilnehemr ist Name von Klasse, nicht von Table
            //System.out.println(rList.get(0).getId());
            return datList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public void delTn(String tnId){
        List<Teilnehmer> tnList = em.createQuery("From Teilnehmer").getResultList();
        Teilnehmer tnDel= new Teilnehmer();
        Klassen kls=new Klassen();
        int id=Integer.parseInt(tnId);
        for (int i=0; i<tnList.size();i++){
            if(id==tnList.get(i).getId()){
                tnDel= tnList.get(i);
                tnDel.setIst("n");
                kls=tnList.get(i).getKls();
                tnDel.setKls(kls); 
                em.merge(tnDel);
            }
        }
        
        if(tnDel!= null){
            
        }
    }

// Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
