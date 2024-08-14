<%-- 
    Document   : DozBauAnzeigen
    Created on : 09.08.2024, 10:08:57
    Author     : EWorster
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Baustein"%>
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
                List<Baustein> bauList = beanCon.invokeBean().getBau();
            %>
            <p class="zagol">Alle Module im Institut:</p>
            <table >
                <tr class="txtBuch">
                    <th>Modul</th> 
                    <th>Modulbeschreibung</th>  
                    <th>Dozent</th>
                </tr>
                 <tr> <td colspan="3" class="txtPlanLine"><hr></td></tr>
                <%
                    for (int i = 0; i < bauList.size(); i++) { 
                    
                %>
                <tr >                  
                    <% try {%>
                    <td class="txtPlan"><%= bauList.get(i).getBauid() %></td>
                    <td class="txtPlan2"><%= bauList.get(i).getBauBeschr() %></td>
                    <td class="txtPlan"><%= bauList.get(i).getDoz().getNnameDoz() %></td>
                    <% } catch (Exception e) {
                        } %>
                </tr>
                <tr> <td colspan="3" class="txtPlanLine"><hr></td></tr>              
                <%}%>
            </table>
                 <p><a href="Home.jsp"> << Zurueck </a><p>
            
        </div>
    </body>
</html>
