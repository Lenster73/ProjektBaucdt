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
                        <td><input type="text" name="nname" id="nname" class="selGross" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Wählen</button>
                        </td>
                    </tr>
                </table>
            </form>
            
            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                        tnNameUse = request.getParameter("nname");
                        String gibtName = "n";
                        //List<Teilnehmer> delTn=beanCon.invokeBean().getTN();
                        for (Teilnehmer t : tnList) {
                            if (t.getTnNname().toLowerCase().contains(tnNameUse)) {
                                gibtName = "y";
                            }
                        }
                 if (gibtName.equalsIgnoreCase("n")){%>
            <p class="txtZur">Wir haben kein TN mit dem Namen <%=tnNameUse %></p>    
                <%}else{
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
                    <tr class="tdtab">
                    <% for (Teilnehmer t : tnList) {
                            if (t.getTnNname().toLowerCase().contains(tnNameUse.toLowerCase())& t.isIst().equalsIgnoreCase("y")) {%>
                    <td class="tdtab2"><%= t.getId()%></td>
                    <td class="tdtab"> <%= t.getTnNname()%></td>
                    <td class="tdtab"><%= t.getTnVname()%></td>
                    <td class="tdtab"><%= t.getTnGeb()%></td>
                    <td class="tdtab2"> <input type="radio" id="id" name="id" value="<%= t.getId()%>"></td> 
                    </tr>
                        <% }
                            }%>

                    <tr>
                        <td colspan="5">
                            <button type="submit" class="btn">Löschen</button>
                        </td>
                    </tr>
                </table>
            </form>
             <% }} %>
            <p ><a href="Home.jsp" class="txtZur"> << Menu</a></p>
        </div>
    </body>
</html>
