/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Baustein;
import entity.Dozent;
import entity.Klassen;
import entity.Raum;
import entity.Termine;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;

/**
 *
 * @author EWorster
 */
public class BauService {
    
    
      public Set<Baustein> createBauSetPlus(List<String> alltxt, List<Dozent> dozList) {
        Set<Baustein> bauSet = new HashSet<>();
        Dozent doz= new Dozent();
        for (int i = 0; i < (alltxt.size() - 2); i += 3) {
            String bauID = alltxt.get(i);
            String bauBesch = (alltxt.get(i + 1));
            String dozid=alltxt.get(i + 2);
           
            Baustein bau = new Baustein(bauID, bauBesch);
            if(dozid.equalsIgnoreCase("-1")){
                doz=null;
                bau.setDoz(doz);
            }else{
                int did=Integer.parseInt(dozid);
                for(int j=0; j<dozList.size(); j++){
                     if(dozList.get(j).getId()==did){
                         doz=new Dozent(dozList.get(j).getId(),
                                 dozList.get(j).getVnameDoz(),dozList.get(j).getNnameDoz());
                         bau.setDoz(doz);
                     }
                }
            }
            bauSet.add(bau);
        }
        return bauSet;
    }


    public Set<Baustein> createBauSet(List<String> alltxt) {
        Set<Baustein> bauSet = new HashSet<>();

        for (int i = 0; i < (alltxt.size() - 2); i += 3) {
            String bauID = alltxt.get(i);
            String bauBesch = alltxt.get(i + 1);
            int did=Integer.parseInt(alltxt.get(i+2));
            Baustein bau = new Baustein(bauID, bauBesch);
            
            bau.getDoz().setId(did);
        }
        return bauSet;
    }

    public List<Dozent> createDozList(List<String> alltxt) {
        List<Dozent> dozList = new ArrayList<>();
        int j = 0;
        for (int i = 0; i < (alltxt.size() - 1); i += 2) {
            String vname = alltxt.get(i);
            String nname = alltxt.get(i + 1);
            Dozent doz = new Dozent(j, vname, nname);
            j++;

            dozList.add(doz);
        }
        return dozList;
    }
    
    public List<Klassen> createKlassen(List<String> alltxt) {
        List<Klassen> klList = new ArrayList<>();
        int j = 0;
        for (int i = 0; i < (alltxt.size()); i ++) {
            String klname = alltxt.get(i);
            Klassen kl = new Klassen(j, klname);
            j++;
            klList.add(kl);
        }
        return klList;
    }
    
    public List<Raum> createRaum(List<String> alltxt) {
        List<Raum> rList = new ArrayList<>();
        int j = 0;
        for (int i = 0; i < (alltxt.size()-1); i +=2) {
            String rname = alltxt.get(i);
            String platz = alltxt.get(i+1);
            Raum raum = new Raum(j, rname, platz);
            j++;
            rList.add(raum);
        }
        return rList;
    }
    
    public List<Termine> useDatTermine(List<String> datUseList, List<Termine> datList){
        List<Termine> datWahlList= new ArrayList<>();
        for(int i=0; i<datUseList.size(); i++){
            int datid=Integer.parseInt(datUseList.get(i));
            for(int j=0; j<datList.size();j++){
                if(datid==datList.get(j).getId()){
                    Termine dat= new Termine(datList.get(j).getStartBau(),
                            datList.get(j).getEndeBau());
                    dat.setBau(datList.get(j).getBau());
                    dat.setKls(datList.get(j).getKls());
                    dat.setRaum(datList.get(j).getRaum());
                    datWahlList.add(dat);
                }
            }
        }
        
        return datWahlList;
    }
    
     

}
