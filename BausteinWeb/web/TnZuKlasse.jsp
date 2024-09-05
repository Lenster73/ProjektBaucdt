<%-- 
    Document   : TnZuKlasse
    Created on : 29.08.2024, 13:13:44
    Author     : EWorster
--%>

<%@page import="entity.Teilnehmer"%>
<%@page import="java.util.List"%>
<%@page import="entity.Klassen"%>
<%@page import="session.BeanConnector"%>
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
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
                <%
                    BeanConnector beanCon = new BeanConnector();
                    Klassen kls = new Klassen();
                    Teilnehmer tn = new Teilnehmer();
                    List<Klassen> klsList = beanCon.invokeBean().getKls();
                    List<Teilnehmer> tnList= beanCon.invokeBean().getTN();
                    String klass = "", tnNameUse="";
                    int tnid=0;
                %>
        <div>
            <br>
            <p class="zagol">Ene Teilnehmer zu Eine Klasse hinzufügen</p>
            <form action="" method="post">
                <table class="tabKlein">
                    <tr class="txtZur">
                        <td>Geben Sie den Teilnehmer-Name ein</td>
                        <td><input type="text" name="nname" id="nname" class="selGross" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" >Wählen</button>
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
                            if (t.getTnNname().toLowerCase().contains(tnNameUse)||t.getTnNname().equalsIgnoreCase(tnNameUse)) {
                                gibtName = "y";
                            }
                        }
                 if (gibtName.equalsIgnoreCase("n")){%>
            <p class="txtZur">Wir haben kein TN mit dem Namen <%=tnNameUse %></p>    
                <%}else{
            %>
            <p class="txtZur">Waehlen Sie bitte ein Teilnehmer: </p>
            <form action="TnKlsUpload.jsp"  method="post" >
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
                    <td class="tdtab2"> <input type="radio" id="id" name="id" value="<%= t.getId()%>" required></td> 
                     
                    </tr>
                   <%}}%>
                   
                      <tr>
                          <th colspan="2"  class="txtZur">Waehlen Sie bitte eine Klasse: <br>
                            <!--<input type="text" name="id" id="id" required>-->
                        </th>
                        <td colspan="3">
                            <label for="kls" class="txtBuch"></label>
                            <select id="kls" name="kls" class="selGross">

                                <% for (int i = 0; i < klsList.size(); i++) {%>
                                <%    try {
                                        kls = klsList.get(i);
                                        klass = kls.getKlassKurz();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> 
                                <option value="<%=klass%>" ><%=klass%></option>
                                <%}%>                       
                            </select><br><br>
                        </td>

                    </tr> 
                     <tr>
                        <td colspan="5">
                            <button type="submit" >Hinzufuegen</button>
                        </td>
                    </tr>
                </table>
            </form>
             <% }} %>

            <p class="txtZur"><a href="Home.jsp"> << Menu</a></p>
        </div>
    </body>
</html>
