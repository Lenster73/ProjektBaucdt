<%-- 
    Document   : DateiUpdate
    Created on : 01.08.2024, 13:22:40
    Author     : EWorster
--%>

<%@page import="entity.Raum"%>
<%@page import="entity.Klassen"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.Baustein"%>
<%@page import="java.util.Set"%>
<%@page import="entity.Dozent"%>
<%@page import="service.BauService"%>
<%@page import="java.util.List"%>
<%@page import="session.BeanConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div>
            <%
                try {
                    BeanConnector beanCon = new BeanConnector();
                    String fNameDoz = "doz.txt";
                    List<String> alltxtDoz;
                    alltxtDoz = beanCon.invokeBean().txtDozAus(fNameDoz);
                    BauService bauSer = new BauService();
                    List<Dozent> dozList = bauSer.createDozList(alltxtDoz);
                    beanCon.invokeBean().addDoz(dozList);

                    String fName = "bauDozTag.txt";
                    List<String> alltxtBauDoz;
                    alltxtBauDoz = beanCon.invokeBean().txtBauDozTagAus(fName);

                    alltxtDoz = beanCon.invokeBean().txtDozAus(fNameDoz);

                    Set<Baustein> bauSet = bauSer.createBauSetTag(alltxtBauDoz, dozList);
                    Iterator<Baustein> iter = bauSet.iterator();

                    beanCon.invokeBean().addBauDB(bauSet);

                    String fname = "klassen.txt";
                    List<String> alltxtKls = beanCon.invokeBean().txtDatModAus(fname);
                    List<Klassen> klList = bauSer.createKlassen(alltxtKls);
                    beanCon.invokeBean().addKl(klList);

                    String rname = "raum.txt";
                    List<String> alltxt = beanCon.invokeBean().txtDozAus(rname);
                    List<Raum> rList = bauSer.createRaum(alltxt);
                    beanCon.invokeBean().addRaum(rList);

                    String tnname = "tn-FI26-alles.csv";
                    String kls = "FI26";
                    beanCon.invokeBean().tnAllesAusFileHinzu(tnname, kls);

                    /*String tnname = "tn-fi27.CSV";
                    String kls = "FI27";
                    beanCon.invokeBean().tnAusFileHinzu(tnname, kls);*/

                    response.sendRedirect("http://localhost:8080/BausteinWeb/Home.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("Die Rechnung wurde schon angelegt. Wählen Sie bitte andere Datei");
                }
            %>
        </div>
    </body>
</html>
