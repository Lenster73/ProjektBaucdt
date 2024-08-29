<%-- 
    Document   : KlassWaelen
    Created on : 01.08.2024, 13:55:15
    Author     : EWorster
--%>

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
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
                <%
                    BeanConnector beanCon = new BeanConnector();
                    Klassen kls = new Klassen();
                    List<Klassen> klsList = beanCon.invokeBean().getKls();
                    String klass = "";
                %>
        <div>
            <br>
            <p class="zagol">Teilnehmern fuer eine Klasse anzeigen</p>

            <form action="KlsTNAnzeigen.jsp" method="post">
                
                <table class="tabKlein">
                    <tr class="txtZur" >
                        <td >Waelen Sie bitte eine Klasse: <br>
                            <!--<input type="text" name="id" id="id" required>-->
                        </td>
                        <td >
                            <label for="kls" class="txtBuch"></label>
                            <select id="id" name="id" class="selGross">

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
                            </select><br>
                        </td>

                    </tr> 
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Ausgeben</button>
                        </td>

                </table>
            </form>
            <p class="txtZur"><a href="Home.jsp"> << Menu</a></p>
        </div>
    </body>
</html>
