<%-- 
    Document   : PlanAnzeigen
    Created on : 01.08.2024, 13:39:50
    Author     : EWorster
--%>

<%@page import="entity.Klassen"%>
<%@page import="entity.Termine"%>
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
        <div ><a href="Home.jsp"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>

            <%
                BeanConnector beanCon = new BeanConnector();
                List<Termine> datList = beanCon.invokeBean().datAus();
                List<Klassen> klsList = beanCon.invokeBean().getKls();
                String klsid = request.getParameter("kls");
                int gibt = 0;
                int kid = 2000;
                for (int i = 0; i < klsList.size(); i++) {
                    if (klsList.get(i).getKlassKurz().equalsIgnoreCase(klsid)) {
                        kid = klsList.get(i).getId();
                        i = klsList.size();
                    }
                }
                for (int i = 0; i < datList.size(); i++) {
                    if (datList.get(i).getKls() != null & datList.get(i).getKls().getKlassKurz().equalsIgnoreCase(klsid)) {
                        gibt++;
                    }
                }
                if (gibt == 0) {
            %>
            <p class="txtBuchCenter">Für die Klasse <%=klsid%> gibt es keine Module.<br><br> Wählen Sie bitte andere Klasse oder buchen Sie neue Module.</p>
                <%} else {%>
            <p class="zagol">Module für Klasse <%=klsid%></p>
            <table >
                <tr class="txtZur">
                    <th>Start</th>
                    <th>Ende</th>

                    <th>Modul</th> 
                    <th>Modulbeschreibung</th>  
                    <th>Dozent</th>
                    <th>Raum</th>

                </tr>
                <tr> <td colspan="6" class="txtPlanLine"><hr></td></tr>
                        <%
                            for (int i = 0; i < datList.size(); i++) {
                                if (datList.get(i).getKls().getKlassKurz().equalsIgnoreCase(klsid)) {
                        %>
                <tr >    
                    <td class="txtPlan"><%= datList.get(i).getStartBau()%></td>
                    <td class="txtPlan"><%= datList.get(i).getEndeBau()%></td>

                    <% try {%>
                    <td class="txtPlan"><%= datList.get(i).getBau().getBauid()%></td>
                    <td class="txtPlan2"><%= datList.get(i).getBau().getBauBeschr()%></td>
                    <td class="txtPlan"><%= datList.get(i).getBau().getDoz().getNnameDoz()%></td>
                    <% String rNr=datList.get(i).getRaum().getRaumNr(); if(rNr!=null){%>
                     <td class="txtPlan"><%= datList.get(i).getRaum().getRaumNr() %></td>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } 
                    %>
                </tr>
                <tr> <td colspan="6" class="txtPlanLine"><hr></td></tr>              
                        <% }
                            }
                    }%>    
            </table>

            <p><a href="KlassWaelen.jsp" class="txtZur"> << Zurueck </a><p>

        </div>
    </body>
</html>
