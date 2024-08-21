<%-- 
    Document   : ModulAnlegen
    Created on : 20.08.2024, 14:59:40
    Author     : EWorster
--%>

<%@page import="entity.Dozent"%>

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
                <%
                    BeanConnector beanCon = new BeanConnector();
                    List<Baustein> bauList = beanCon.invokeBean().getBau();
                    List<Dozent> dozList = beanCon.invokeBean().getDoz();
                    String dName = "", bauID = "", bauidUse = "", antw = "n";
                    String tagUse = "", bauBesch = "", dozID = "";
                %>
        <div>

            <form action="" method="post">
                <br>
                <p class="zagol">Neue Module anlegen</p>
                <table class="tabKlein">
                    <tr>
                        <th  class="txtZur" colspan="2">
                            <label for="bauid" >Kurze Beschreibung (4 Symbol):</label>
                            <input type="text" name="bauid" id="bauid" class="inputTXT" required>
                        </th>
                    </tr>
                    <tr>
                        <th  class="txtZur" colspan="2">
                            <label for="tag" >Dauer (wie viele Tage):</label>
                            <input type="number" name="tag" id="tag" class="inputTXT" required>
                        </th>
                    </tr>

                    <td colspan="3">
                        <button type="submit" class="btn">Bestätigen</button>
                    </td>
                </table>
            </form>        


            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    bauidUse = request.getParameter("bauid");
                    tagUse = request.getParameter("tag");

                    for (int i = 0; i < bauList.size(); i++) {

                        bauID = bauList.get(i).getBauid();
                        if (bauID.equalsIgnoreCase(bauidUse)) {
                            antw = "y";
                        }
                    }
                    if (antw.equalsIgnoreCase("y")) {%>
            <p class="txtZur">Modul <%=bauidUse%> gibt es schon bei uns </p> 
            <% } else {
            %> 
            <p class="txtZur">Für Modul <%=bauidUse%> geben Sie bitte ein: </p>
            <form action="" method="post">
                <table class="tabKlein">
                    <tr>    
                        <th  class="txtZur" colspan="4">
                            <label for="besch" >Volle Beschreibung:</label>
                            <input type="text" name="besch" id="besch" class="inputTXT" required>
                        </th>
                    </tr>
                    <tr>
                        <td class="txtZur" colspan="4">
                            <label for="besch" >Wissen Sie schon welche Dozent wird es unterrichtet?:</label>
                        </td></tr>

                    <tr class="tdtab">            
                        <td class="tdtab">Ich möchte Ein Dozent wählen</td> 
                        <td class="tdtab2"> <input type="radio" id="jain" name="jain" value="y" ></td> 
                        <td class="tdtab">Ich bin keine Ahnung wer es wird</td>
                        <td class="tdtab2"> <input type="radio" id="jain" name="jain" value="n" ></td> 

                    </tr>

                    <td colspan="3">
                        <button type="submit" class="btn">Bestätigen</button>
                    </td>

                </table>
            </form><!-- comment -->

            <% }
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                    bauBesch = request.getParameter("besch");
                    antw = request.getParameter("jain");
                    if (antw.equalsIgnoreCase("y")) {
            %>
            <form action="ModuleUpload.jsp" method="post">
                <table class="tabKlein">
                    <tr>
                        <td class="txtZur" colspan="3"> <label class="txtZur">Waehlen Sie bitte ein Dozent: </label></td>
                    </tr>
                    <tr class="txtZur">
                        <th  >Nachname:</th>
                        <th  >Vorname:</th>
                        <th  ></th>
                    </tr>
                    <tr class="tdtab">
                        <% for (Dozent d : dozList) {%>

                        <td class="tdtab"><%= d.getNnameDoz()%></td>
                        <td class="tdtab"><%= d.getVnameDoz()%></td>

                        <td class="tdtab2"> <input type="radio" id="id" name="id" value="<%= d.getId()%>" ></td> 
                    </tr>

                    <%}%> 
                    <tr>
                        <td colspan="3">
                            <button type="submit" class="btn">Anlegen</button>
                        </td>
                    </tr>   
                </table>     
            </form>
            <p class="txtZur"><a href="Home.jsp"> << Menu</a></p>
            <%  }
                        }
                    
                }%>
        </div>
    </body>
</html>
