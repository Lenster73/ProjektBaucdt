<%-- 
    Document   : MadulAnlegenGPT
    Created on : 21.08.2024, 13:12:53
    Author     : EWorster
--%>

<%@page import="java.util.List"%>
<%@page import="session.BeanConnector"%>
<%@page import="entity.Baustein"%>
<%@page import="entity.Dozent"%>
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
                    // Initialize BeanConnector and get lists of modules and instructors
                    BeanConnector beanCon = new BeanConnector();
                    List<Baustein> bauList = beanCon.invokeBean().getBau();
                    List<Dozent> dozList = beanCon.invokeBean().getDoz();

                    // Retrieve parameters from the request
                    String bauidUse = request.getParameter("bauid");
                    String tagUse = request.getParameter("tag");
                    String besch = request.getParameter("besch");
                    String jain = request.getParameter("jain");
                    String selectedDozentId = request.getParameter("did");

                    boolean moduleExists = false;

                    if (bauidUse != null) {
                        for (Baustein baustein : bauList) {
                            if (baustein.getBauid().equalsIgnoreCase(bauidUse)) {
                                moduleExists = true;
                                break;
                            }
                        }
                    }
                %>

        <div>
            <% if (bauidUse == null) { %>
            <!-- Step 1: Collect short description and duration -->
            <form action="" method="post" class="tabKlein">
                <p class="zagol">Neue Module anlegen</p>
                <label for="bauid" class="txtZur">Kurze Beschreibung (4 Symbole):</label>
                <input type="text" name="bauid" id="bauid" class="inputTXT" required><br><p>
                    <label for="tag" class="txtZur">Dauer (Tage):</label>
                <input type="number" name="tag" id="tag" class="inputTXT" required><br><p>
                    <button type="submit" class="btnOneTab">Bestätigen</button>
            </form>

            <% } else if (moduleExists) {%>
            <!-- Module already exists -->
            <p class="zagol">Neue Module anlegen</p>
            <p class="txtZur">Das Modul <%= bauidUse%> existiert bereits.</p>
            <p class="txtZur"><a href="ModulAnlegenGPT.jsp">Zurück </a></p>

            <% } else if (besch == null) {%>
            <!-- Step 2: Collect full description and ask about the instructor -->
            <form action="" method="post" class="tabKlein"> 
                <p class="zagol">Neue Module anlegen</p>
                <input type="hidden" name="bauid" value="<%= bauidUse%>" class="inputTXT">
                <input type="hidden" name="tag" value="<%= tagUse%>" class="inputTXT">
                <p class="txtZur">Für Modul <%= bauidUse%> geben Sie bitte eine vollständige Beschreibung ein:</p>
                <label for="besch" class="txtZur">Vollständige Beschreibung:</label>
                <input type="text" name="besch" id="besch" class="inputTXT" required ><br><p>
                    <label class="txtZur">Wissen Sie schon, welcher Dozent unterrichten wird?</label><p>
                    <input type="radio" id="jain" name="jain" value="y" class="inputRadio" required> Ja &nbsp;  &nbsp; &nbsp;  &nbsp;
                <input type="radio" id="jain" name="jain" value="n" class="inputRadio" required> Nein<br><p>
                    <button type="submit" class="btnOneTab">Bestätigen</button>
            </form>

            <% } else if ("y".equalsIgnoreCase(jain)) {%>
            <!-- Step 3: Select a Dozent -->
            <form action="ModuleUpload.jsp" method="post" class="tabKlein">
                <p class="zagol">Neue Module anlegen</p>
                <input type="hidden" name="bauid" value="<%= bauidUse%>" class="inputTXT">
                <input type="hidden" name="tag" value="<%= tagUse%>" class="inputTXT">
                <input type="hidden" name="besch" value="<%= besch%>" class="inputTXT">
                <p class=txtBuch">Wählen Sie einen Dozenten:</p>
                <% for (Dozent d : dozList) {%>
                <input type="radio" id="did" name="did" value="<%= d.getId()%>" class="inputRadio" required > <%= d.getNnameDoz()%>, <%= d.getVnameDoz()%><br>
                <% } %><p>
                    <button type="submit" class="btnOneTab">Anlegen</button>
            </form>

            <% } else { %>
            <!-- Final Step: Submit without selecting a Dozent -->
            <form action="ModuleUpload.jsp" method="post" class="tabKlein">
                <p class="zagol">Neue Module anlegen</p>
                <input type="hidden" name="bauid" value="<%= bauidUse%>" class="inputTXT">
                <input type="hidden" name="tag" value="<%= tagUse%>" class="inputTXT">
                <input type="hidden" name="besch" value="<%= besch%>" class="inputTXT">
                <p class=txtZur">Modul <%= bauidUse%> wird ohne Dozenten angelegt.</p>
                <input type="hidden" name="did" value="-1" class="inputTXT">
                <button type="submit" class="btnOneTab">Anlegen</button>
            </form>
            <% }%>
            <p class="txtZur"><a href="ModulAnlegen.jsp"> << Zurück</a></p>
        </div>

    </body>
</html>
