<%-- 
    Document   : TnWaelen
    Created on : 20.08.2024, 11:12:26
    Author     : EWorster
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Teilnehmer"%>
<%@page import="entity.Klassen"%>
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
                <%
                    BeanConnector beanCon = new BeanConnector();
                    Klassen kls = new Klassen();
                    Teilnehmer tn= new Teilnehmer();
                    List<Teilnehmer> tnList = beanCon.invokeBean().getTN();
                    String tnName = "", tnVname="", tnNameUse="";
                    String tnId="";
                %>
        <div>
            <br>
            <p class="zagol">TN löschmarkieren</p>

            <form action="" method="post">
                <table class="tabKlein">
                    <tr class="txtZur">
                        <td>Geben Sie den Name ein</td>
                        <td><input type="text" name="nname" id="nname" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Wählen</button>
                        </td>
                    </tr>
                </table>
            </form>
            
            <%
                if(request.getMethod().equalsIgnoreCase("POST")){
                tnNameUse=request.getParameter("nname");
                //List<Teilnehmer> delTn=beanCon.invokeBean().getTN();
                
            %>
            <p class="txtZur">Waehlen Sie bitte ein Teilnehmer: </p>
            <form action="TnLoeschen.jsp"  method="post" >
                <table class="tabKlein">
                    <tr class="txtZur">
                        <th  >TN-Nr:</th>
                        <th  >TN-Name:</th>
                        <th  >TN-Vorname:</th>
                        <th  >TN-Geb.Datum:</th>
                    </tr>
                    <% for (Teilnehmer t : tnList) {
                            if (t.getTnNname().toLowerCase().contains(tnNameUse.toLowerCase())) {%>
                    <td><%= t.getId()%></td>
                    <td><%= t.getTnNname()%></td>
                    <td><%= t.getTnVname()%></td>
                    <td><%= t.getTnGeb()%></td>
                    <td> <input type="radio" id="id" name="id" value="<%= t.getId()%>"></td> 
                    <tr>
                        <% }
                            }%>

                    <tr>
                        <td colspan="5">
                            <button type="submit" class="btn">Löschen</button>
                        </td>

                </table>
            </form>
             <% } %>
            <p ><a href="Home.jsp" class="txtZur"> << Menu</a></p>
        </div>
    </body>
</html>
