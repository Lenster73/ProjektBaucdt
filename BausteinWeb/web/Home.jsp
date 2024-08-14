<%-- 
    Document   : Home
    Created on : 31.07.2024, 11:46:03
    Author     : EWorster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.Date" %>
<%@page import="session.BeanConnector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div ><a href="Home.jsp"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            
            <p class="zagol">Vor Nutzung der Anwendung bitte regelmäßig alle Datenquellen aktualisieren!</p>
            <table>
                <tr>
                    <th >Datei UPLOAD/UPDATE:</th>  
                    <th></th>
                     <th></th>
                      <th></th>
                </tr>
                <tr >
                    <td  colspan="2"><a href="DateiUpdate.jsp"> <button type="btn" >Dateien aktualisieren</button></a><p></td>
                   
                    <td colspan="2" ><a href="DateiWaelen.jsp"> <button type="btn" >Alten Plan waehlen und hochladen</button></a><p></td>
                </tr>
               <tr>
                    <th colspan="4">Module anzeigen:</th>
                </tr>
                <tr>
                    <td colspan="2"><a href="DozBauAnzeigen.jsp"><button type="btn">Alle Module anzeigen</button></a><p></td>                 
                    <td colspan="2"><a href="DatumWaelen.jsp"> <button type="btn">Module fuer einen Stichtag anzeigen</button></a><p></td>
                </tr>
                <tr>                    
                    <th colspan="4">Klassen anzeigen oder bearbeiten:</th>                   
                </tr>
                <tr>
                    <td colspan="2"><a href="KlassWaelen.jsp"><button type="btn" >Plan für eine Klasse anzeigen</button></a><p></td>
                    <td colspan="1"><a href="TerminBuch.jsp"> <button type="btn">Modul-Termin aendern</button></a><p></td>
                    <td colspan="1"><a href="TerminBauBuch.jsp"> <button type="btn">Modul-Termin buchen</button></a><p></td>
                </tr>
                
                <tr>
                    <th colspan="4">Teilnehmern hinzufuegen, loeschen oder die Klasse fuer TN aendern:</th>
                </tr>
                <tr>
                    <td colspan="2"><a href="KlassWaelenTN.jsp"><button type="btn">TN einer Klasse anzeigen</button></a><p></td>
                    <td colspan="2"><a href="TnHinzu.jsp"> <button type="btn" >TN zu einer Klasse hinzufuegen</button></a><p></td>
               
            </table>
        </div>
    </body>
</html>
