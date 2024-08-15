<%-- 
    Document   : TnHinzu
    Created on : 13.08.2024, 10:45:27
    Author     : EWorster
--%>

<%@page import="entity.Teilnehmer"%>
<%@page import="java.util.List"%>
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
                    List<Klassen> klsList = beanCon.invokeBean().getKls();
                    Teilnehmer tn = new Teilnehmer();
                    String klass = "";
                %>
        <div>
            <br>
            <p class="zagol">Neuen Teilnehmer hinzufügen</p>

            <form action="TnUpload.jsp" method="post">
                
                <table class="tabKlein">
                    <tr>
                        <th  class="txtZur">Waehlen Sie bitte eine Klasse: <br>
                            <!--<input type="text" name="id" id="id" required>-->
                        </th>
                        <td>
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
                        <td>
                            <label for="nameTN" class="txtZur">Nachname:</label>
                            <input type="text" name="nameTN" id="nameTN" class="selGross"><br><br>
                        </td>
                        <td>
                            <label for="vornameTN" class="txtZur">Vorname:</label>
                            <input type="text" name="vornameTN" id="vornameTN" class="selGross"><br><br>
                        </td>
                        <td>
                            <label for="gebTN" class="txtZur">Geburtsdatum:</label>
                            <input type="date" name="gebTN" id="gebTN" class="selGross"><br><br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <button type="submit" class="btn">Ausgeben</button>
                        </td>

                </table>
            </form>
            <p class="txtZur"><a href="Home.jsp"> << Menu</a></p>
        </div>
    </body>
</html>
