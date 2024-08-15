<%-- 
    Document   : TerminBauBuch
    Created on : 13.08.2024, 08:41:37
    Author     : EWorster
--%>

<%@page import="entity.Baustein"%>
<%@page import="java.util.List"%>
<%@page import="entity.Klassen"%>
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
        <div ><a href="Home.jsp"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            <%
                BeanConnector beanCon = new BeanConnector();
                Klassen kls = new Klassen();
                List<Klassen> klsList = beanCon.invokeBean().getKls();
                String klass = "", modul = "";
                Baustein bau = new Baustein();
                List<Baustein> bauList = beanCon.invokeBean().getBau();
            %>



            <form action="TerminBauUpload.jsp" method="post">
                <br>
                <p class="zagol">Termin Buchen</p>
                <table class="tabKlein">
                    <tr class="txtZur">
                        <th colspan="2"><label >Geben Sie bitte ein:</label> </th>
                    </tr>
                    <tr>
                        <td>
                            <label for="kls" class="txtZur">Klasse:</label>
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
                            </select><br>
                        </td>
                        <td>
                            <label for="modul" class="txtZur">Modul:</label>
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
                            <label for="startD" class="txtZur">Start Date:</label>
                            <input type="date" name="startD" id="startD" class="selGross"><br><br>
                        </td>
                        <td>
                            <label for="endeD" class="txtZur">End Date:</label>
                            <input type="date" name="endeD" id="endeD" class="selGross"><br><br>
                        </td>
                    </tr>
                    

                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Termin buchen</button> <p>
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
