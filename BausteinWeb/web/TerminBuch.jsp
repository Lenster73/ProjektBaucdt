<%-- 
    Document   : TerminBuch
    Created on : 06.08.2024, 12:16:56
    Author     : EWorster
--%>
<%@page import="entity.Termine"%>
<%@page import="entity.Baustein"%>
<%@page import="entity.Klassen"%>
<%@page import="java.util.List"%>
<%@page import="service.BauService"%>
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
                Klassen kls = new Klassen();
                List<Klassen> klsList = beanCon.invokeBean().getKls();
                String klass = "", modul = "";
                Baustein bau = new Baustein();
                List<Baustein> bauList = beanCon.invokeBean().getBau();
                Termine dat = new Termine();
                List<Termine> datList = beanCon.invokeBean().datAus();
            %>



            <form action="TerminUpload.jsp" method="post">
                <p class="zagol">Modul-Termin ändern</p>
                <table class="tabKlein">
                    <tr>
                        <th colspan="2"><label class="txtBuch">Geben Sie bitte ein:</label> <p></th>
                    </tr>
                    <tr>
                        <td>
                            <label for="kls" class="txtBuch">Klasse:</label>
                            <select id="kls" name="kls" class="selGross">

                                <% for (int i = 0; i < klsList.size(); i++) {%>
                                <%    try {
                                        kls = klsList.get(i);
                                        klass = kls.getKlassKurz();
                                        dat=kls.getDatList().get(i);
                                        %>
                                        <option value="<%=klass%>" ><%=klass%></option>
                                   <%  } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                   
                                %> 
                                <option value="<%=klass%>" ><%=klass%></option>
                                <%  }%>                       
                            </select><br>
                        </td>
                        <td>
                            <label for="modul" class="txtBuch">Modul:</label>
                            <select id="modul" name="modul" class="selGross">

                                <% for (int i = 0; i < bauList.size(); i++) {%>
                                <%    try {
                                        bau = bauList.get(i);
                                        modul = bau.getBauid();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> 
                                <option value="<%=modul%>" ><%=modul%></option>
                                <%}%>                       


                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="startD" class="txtBuch">Start Date:</label>
                            <input type="date" name="startD" id="startD" class="selGross"><br><br>
                        </td>
                        <td>
                            <label for="endeD" class="txtBuch">End Date:</label>
                            <input type="date" name="endeD" id="endeD" class="selGross"><br><br>
                        </td>
                    </tr>
                    

                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Termin aendern</button> <p>
                        </td>   </tr>  
                    <tr>
                        <td>
                            <a href="Home.jsp"> << Menu</a></p>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


    </body>
</html>
