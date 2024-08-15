<%-- 
    Document   : PlanAnzeigen
    Created on : 01.08.2024, 13:39:50
    Author     : EWorster
--%>

<%@page import="java.util.Collections"%>
<%@page import="entity.Teilnehmer"%>
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
                List<Teilnehmer> tnList = beanCon.invokeBean().getTN();
                List<Klassen> klsList = beanCon.invokeBean().getKls();
                tnList.sort((t1, t2) -> t1.getTnNname().compareTo(t2.getTnNname()));
               
                String klsid = request.getParameter("id");
                int gibt=0;
                int kid=800;
                for (int i = 0; i < klsList.size(); i++) {
                    if (klsList.get(i).getKlassKurz().equalsIgnoreCase(klsid)) {
                        kid = klsList.get(i).getId();
                        i = klsList.size();
                    }
                }
                
                 for(int i=0; i<tnList.size();i++){
                 if(tnList.get(i).getKls()!=null && tnList.get(i).getKls().getKlassKurz().equalsIgnoreCase(klsid)){
                        gibt++;
                } }
                   if(gibt==0){          
            %>
            <p class="txtBuchCenter">Für die Klasse <%=klsid %> <br>gibt es keine Teilnehmern.<br><br> Wählen Sie bitte andere Klasse.</p>
            <%} else{%>
            <p class="zagol">Teilnehmern für die Klasse <%=klsid%></p>
            <table >
                <tr class="txtBuch">
                    <th>Nachname</th>
                    <th>Vorname</th>
                    <th>Geb. Datum</th>  
                </tr>
                 <tr> <td colspan="3" class="txtPlanLine"><hr></td></tr>
                <%
                    for (int i = 0; i < tnList.size(); i++) { 
                    int suchid=tnList.get(i).getKls().getId();
                        if (suchid == kid) {
                        gibt++;
                %>
                <tr >        
                    <% try {%>
                    <td class="txtPlan"><%= tnList.get(i).getTnNname() %></td>
                    <td class="txtPlan2"><%= tnList.get(i).getTnVname() %></td>
                    <td class="txtPlan"><%= tnList.get(i).getTnGeb() %></td>
                    <% } catch (Exception e) {
                        } %>
                </tr>
                <tr> <td colspan="3" class="txtPlanLine"><hr></td></tr>              
                <%}%>
                <%} }%>    
            </table>
               
                 <p><a href="KlassWaelenTN.jsp"> << Zurueck </a><p>
            
        </div>
    </body>
</html>
