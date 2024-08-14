/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package bausteinclient;

import entity.Baustein;
import entity.Dozent;
import entity.Klassen;
import entity.Teilnehmer;
import entity.Termine;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import service.BauService;
import session.BausteinBeanRemote;

/**
 *
 * @author EWorster
 */
public class BausteinClient {

    /**
     * @param args the command line arguments
     */
    BufferedReader brConsoleReader = new BufferedReader(new InputStreamReader(System.in));
    BausteinBeanRemote beanRemote;

    {
        try {
            BeanConnector con = new BeanConnector();
            beanRemote = con.invokeBean();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws ParseException {

        BausteinClient client = new BausteinClient();
        client.loadDoz();
        client.loadBauDB();
        client.loadKlassen();
        client.loadDatum();
//        client.aendernDatum();
        client.tnHizufuegen();
        client.getDatBau();

//        String dataAusF = "11.10.2023";
//        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd.MM.yyyy");
//
//        LocalDate date = LocalDate.parse(dataAusF, format);
//        System.out.println(date);
//        String dataAusF = "11-10-2023";
//        DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
//        Date date = format.parse(dataAusF);
//        System.out.println(date);
        String dateString = "11.10.2023";

        // Definieren des Datumsformats, das dem String entspricht
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd.MM.yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");

        try {
            // Konvertieren des Strings in ein Date-Objekt
            Date date = inputFormat.parse(dateString);

            // Formatieren des Date-Objekts zu einem String ohne Uhrzeit
            String ausDate = outputFormat.format(date);

        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    public void start() {

        String dateStart = "09.10.2023";
        String dateEnde = "20.10.2023";
        // Definieren des Datumsformats, das dem String entspricht
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd.MM.yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");

        try {
            // Konvertieren des Strings in ein Date-Objekt
            Date dateS = inputFormat.parse(dateStart);
            Date dateE = inputFormat.parse(dateEnde);
            // Formatieren des Date-Objekts zu einem String ohne Uhrzeit
            String ausDateS = outputFormat.format(dateS);
            String ausDateE = outputFormat.format(dateE);
            System.out.println(ausDateS + "   -    " + ausDateE);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public void loadKlassen() {
        BauService bauSer = new BauService();
        String fname = "klassen.txt";
        List<String> alltxt = beanRemote.txtDatModAus(fname);
        List<Klassen> klList = bauSer.createKlassen(alltxt);
        beanRemote.addKl(klList);
    }

    public void aendernDatum() {
        String klass = "FI28";
        String modul = "M19E";
        String startDat = "2025.10.06";
        String endDat = "2025.10.20";

        beanRemote.ersetzDatumDB(klass, modul, startDat, endDat);
    }

//    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    public void getDatBau() {

        String userDatum = "2022-09-07";
        List<Termine> datUseIdList=beanRemote.getDatBau(userDatum);
        for (int i = 0; i < datUseIdList.size(); i++) {
            System.out.println(datUseIdList.get(i));
        }

    }

    public void tnHizufuegen() {
        String fname = "tn-fi27.CSV";
        String kls = "FI28";
        beanRemote.tnAusFileHinzu(fname, kls);

    }

    public void loadDatum() {
        BauService bauSer = new BauService();
        String fNameDat = "FI28.txt";
        int punktIndex = fNameDat.lastIndexOf('.');
        String klname = "?????";
        String bauDat = "";
        if (punktIndex != -1) {
            klname = fNameDat.substring(0, punktIndex);
        }

        List<String> alltxt = beanRemote.txtDatModAus(fNameDat);

        List<String> datum = beanRemote.addDatum(alltxt);

//        for (int i = 0; i < datum.size(); i++) {
//            System.out.println(datum.get(i));
//        }
//        
//        System.out.println(klname);
        beanRemote.addDatumBauManyDB(datum, klname);

        //beanRemote.addDatumBauDB(datum, klname);
    }

    public void loadBauDB() {
        BauService bauSer = new BauService();
        String fName = "bauDoz.txt";
        List<String> alltxt;
        alltxt = beanRemote.txtBauDozAus(fName);

        String fNameDoz = "doz.txt";
        List<String> alltxtDoz;
        alltxtDoz = beanRemote.txtDozAus(fNameDoz);
        List<Dozent> dozList = bauSer.createDozList(alltxtDoz);

        Set<Baustein> bauSet = bauSer.createBauSetPlus(alltxt, dozList);
        Iterator<Baustein> iter = bauSet.iterator();

        beanRemote.addBauDB(bauSet);
    }

    public void loadDoz() {
        String fNameDoz = "doz.txt";
        List<String> alltxtDoz;
        alltxtDoz = beanRemote.txtDozAus(fNameDoz);
        BauService bauSer = new BauService();
        List<Dozent> dozList = bauSer.createDozList(alltxtDoz);
        beanRemote.addDoz(dozList);
    }

}
