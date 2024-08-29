<%-- 
    Document   : TerminBauBuch
    Created on : 13.08.2024, 08:41:37
    Author     : EWorster
--%>

<%@page import="entity.Raum"%>
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
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            <%
                BeanConnector beanCon = new BeanConnector();
                Klassen kls = new Klassen();
                List<Klassen> klsList = beanCon.invokeBean().getKls();
                String klass = "", modul = "", raumNr="";
                Baustein bau = new Baustein();
                List<Baustein> bauList = beanCon.invokeBean().getBau();
                Raum raum = new Raum();
                List<Raum> rList = beanCon.invokeBean().getRaum();
            %>



            <form action="TerminBauUpload.jsp" method="post">
                <br>
                <p class="zagol">Termin Buchen</p>
                <table class="tabKlein">
                    <tr class="txtZur" >
                        <th colspan="6"><label>Geben Sie bitte ein:</label> </th>
                    </tr>
                    <tr>
                        <td colspan="2">
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
                        <td colspan="2">
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
                        <td colspan="2">
                            <label for="raum" class="txtZur">Raum:</label>
                            <select id="raum" name="raum" class="selGross">

                                <% for (int i = 0; i < rList.size(); i++) {%>
                                <%    try {
                                        raum = rList.get(i);
                                        raumNr = raum.getRaumNr();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> 
                                <option value="<%=raumNr%>" ><%=raumNr%> (Sitzplaetze: <%=raum.getPlatzAnz() %>)</option>
                                <%}%>                       
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label for="startD" class="txtZur">Start Date:</label>
                            <input type="date" name="startD" id="startD" class="selGross"><br><br>
                        </td>
                        <td colspan="3">
                            <label for="endeD" class="txtZur">End Date:</label>
                            <input type="date" name="endeD" id="endeD" class="selGross"><br><br>
                        </td>
                    </tr>
                    

                    <tr>
                        <td colspan="6">
                            <button type="submit" class="btn">Termin buchen</button> <p>
                        </td>   </tr>  
                    <tr>
                        <td  colspan="6">
                            <a href="Home.jsp" class="txtZur"> << Menu</a></p>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


    </body>
</html>
