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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    <body>
        <div ><a href="Home.jsp"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            
            <p class="zagol">Vor Nutzung der Anwendung bitte regelmäßig alle Datenquellen aktualisieren!</p>
            <table>
                <tr>
                    <th colspan="3" class="txtZur">Datei UPLOAD/UPDATE:</th>  
                    
                </tr>
                <tr >
                    <td  colspan="3"><a href="DateiUpdate.jsp"> <button type="btn" >Dateien aktualisieren</button></a><p></td>
                   
                    <td colspan="3" ><a href="DateiWaelen.jsp"> <button type="btn" >Alten Plan waehlen und hochladen</button></a><p></td>
                </tr>
               <tr>
                    <th colspan="6"  class="txtZur">Module:</th>
                </tr>
                <tr>
                    <td colspan="2"><a href="DozBauAnzeigen.jsp"><button type="btn">Alle Module anzeigen</button></a><p></td>                 
                    <td colspan="2"><a href="DatumWaelen.jsp"> <button type="btn">Module fuer einen Stichtag anzeigen</button></a><p></td>
                    <td colspan="2"><a href="ModulAnlegen.jsp"> <button type="btn">Neue Module anlegen</button></a><p></td>
                </tr>
                <tr>                    
                    <th colspan="6"  class="txtZur">Klassen anzeigen oder bearbeiten:</th>                   
                </tr>
                <tr>
                    <td colspan="2"><a href="KlassWaelen.jsp"><button type="btn" >Plan für eine Klasse anzeigen</button></a><p></td>
                    <td colspan="2"><a href="TerminBuch.jsp"> <button type="btn">Modul-Termin aendern</button></a><p></td>
                    <td colspan="2"><a href="TerminBauBuch.jsp"> <button type="btn">Modul-Termin buchen</button></a><p></td>
                </tr>
                 <tr>
                    <th colspan="6"  class="txtZur">Teilnehmern hinzufuegen oder inaktiv setzen:</th>
                </tr> 
               <tr>
                    <td colspan="6"><a href="NeuTnAnlegen.jsp"><button type="btn">Neue Teilnehmer anlegen</button></a><p></td>
                    
                </tr>
               <tr>
                    <td colspan="2"><a href="KlassWaelenTN.jsp"><button type="btn">TN einer Klasse anzeigen</button></a><p></td>
                    <td colspan="2"><a href="TnHinzu.jsp"> <button type="btn" >TN zu einer Klasse hinzufuegen</button></a><p></td>
                    <td colspan="2"><a href="TnWaelen.jsp"> <button type="btn" >TN inaktiv setzen</button></a><p></td>
                </tr>
            </table>
        </div>
    </body>
</html>
