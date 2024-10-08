<%-- 
    Document   : DatumBauAnzeigen
    Created on : 09.08.2024, 11:17:13
    Author     : EWorster
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="entity.Termine"%>
<%@page import="entity.Baustein"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="session.BeanConnector"%>
<%@page import="service.BauService"%>
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
                String userDat = request.getParameter("dat");
                try {
                    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");

                    Date dateUse = inputFormat.parse(userDat);
                    String useDatCool = outputFormat.format(dateUse);
                    BeanConnector beanCon = new BeanConnector();
                    List<Termine> datUseList = beanCon.invokeBean().getDatBau(userDat);                   
                    if(datUseList.size()==0){          
            %>
            <p class="txtBuchCenter">Am <%=useDatCool %> <br>gibt es keine Module .<br><br>Wählen Sie bitte andere Datum.</p>
            <%} else{%>
            
            <p class="txtBuch"> Am <%=useDatCool %> laufen folgende Module:<p>
                <table >
                <tr class="txtZur">
                    
                    <th>Modul</th> 
                    <th>Modulbeschreibung</th>
                    <th>Start-Ende</th> 
                    <th>Klasse</th> 
                    <th>Dozent</th>
                    <th>Raum</th>
                </tr>
                 <tr> <td colspan="6" class="txtPlanLine"><hr></td></tr>
                <%
                    for (int i = 0; i < datUseList.size(); i++) { 
                    
                %>
                <tr >                  
                    <% try {%>
                    
                    <td class="txtPlan"><%= datUseList.get(i).getBau().getBauid() %></td>
                    <td class="txtPlan2"><%= datUseList.get(i).getBau().getBauBeschr() %></td> 
                    <td class="txtPlan2"><%= datUseList.get(i).getStartBau()+" - "+datUseList.get(i).getEndeBau()  %></td>
                    <td class="txtPlan"><%= datUseList.get(i).getKls().getKlassKurz() %></td>
                    <td class="txtPlan"><%= datUseList.get(i).getBau().getDoz().getNnameDoz() %></td>
                    <td class="txtPlan"><%= datUseList.get(i).getRaum().getRaumNr() %></td>
                    <% } catch (Exception e) {
                        } %>
                </tr>
                <tr> <td colspan="6" class="txtPlanLine"><hr></td></tr>              
                <%}%>
            </table>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("Nicht geklapt!!! Keine Ahnung warum");
                    }

                %>

            <p>
                <a href="DatumWaelen.jsp" class="txtZur"> << Zurück </a><p>

        </div>
    </body>
</html>
