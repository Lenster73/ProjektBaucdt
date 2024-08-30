<%-- 
    Document   : NeuTnAnlegenVar2
    Created on : 27.08.2024, 11:52:56
    Author     : EWorster
--%>

<%@page import="session.BeanConnector"%>
<%@page import="java.util.List"%>
<%@page import="entity.Teilnehmer"%>
<%@page import="entity.Klassen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CDT Neu Teilnehmer anlegen</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
                <%
                    // Initialize BeanConnector and get lists of modules and instructors
                    BeanConnector beanCon = new BeanConnector();
                    List<Klassen> klsList = beanCon.invokeBean().getKls();
                    List<Teilnehmer> tnList = beanCon.invokeBean().getTN();

                    // Retrieve parameters from the request
                    String tid = request.getParameter("id");
                    String tgend=request.getParameter("gend");
                    String tname = request.getParameter("name");
                    String tvname = request.getParameter("vname");
                    String tstr = request.getParameter("str");
                    String tplz = request.getParameter("plz");
                    String tort = request.getParameter("ort");
                    String ttel = request.getParameter("tel");
                    String tmail = request.getParameter("email");
                    String tgeb = request.getParameter("geb");
                    String tgebort = request.getParameter("gebort");
                    String tnation = request.getParameter("nat");
                    String tberuf = request.getParameter("beruf");
                    String tabschl = request.getParameter("abschl");
                    String tberater = request.getParameter("berat");
                    String jcNum = request.getParameter("jc");
                    
                    String vertragNr = request.getParameter("vnr");
                    String tkurs = request.getParameter("kurs");
                    String klsid = request.getParameter("kid");
                    String jain=request.getParameter("jain");
                    boolean moduleExists = false;
                    int tnid;
                    if (tid != null && !tid.isEmpty()) {
                            tnid = Integer.parseInt(tid);
                        } else{
                        tnid=0;
                    }
                   
                    if (tid!= null) {
                        for (Teilnehmer tn : tnList) {                   
                            if (tn.getId()==tnid) {
                                moduleExists = true;
                                break;
                            }
                        }
                    }
                %>

        <div>
            <% if (tid == null) { %>
            <!-- Step 1: Collect short description and duration -->
            <form action="" method="post">
                <p class="txtZagolovokTop">Neue Teilnehmer anlegen</p>
                <table class="tableAnketa">
                    <tr>
                        <td colspan="2"><label for="id" class="txt14Medium">TN-Nummer (5 Ziffern):</label> <br>
                            <input type="number" min="10000" max="99999" title="Nur 5 Ziffern" name="id" id="id" class="inputTXT" required> </td>
                    </tr>
                    
                    <tr>
                        <td ><label class="txt14Medium">Anrede:</label></td>
                        <td>
                            <input type="radio" id="m" name="gend" value="m" class="inputRadioOhne" required> 
                            <label for="m" class="labelRadio">Herr</label>
                               
                        </td >

                        <td >
                            <input type="radio" id="w" name="gend" value="w" class="inputRadioOhne" required> 
                            <label for="w" class="labelRadio">Frau</label>                          
                       </td >
                      
                        <td >
                            <input type="radio" id="d" name="gend" value="d" class="inputRadioOhne" required>
                            <label for="d" class="labelRadio">Keine</label> 
                        </td > 
                        <!--<input type="text" name="gend" id="gend" maxlength="1" title="Nur eine Buchstabe w, m oder d"  class="inputTXT" required> </td>-->
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    
                    </tr>
                    
                    <tr>
                        <td  colspan="8"><label for="name"  class="txt14Medium">Nachname:</label><br>
                        <input type="text" name="name" id="name" class="inputTXT" required></td>    
                    </tr>
                    <tr>
                        <td colspan="8"><label for="vname" class="txt14Medium">Vorname:</label><br>
                        <input type="text" name="vname" id="vname" class="inputTXT" required></td><p>
                    </tr>         
                </table>
                 <p><button type="submit" class="btnLangFuerAlle">Bestätigen</button></p>
            </form>
           
           <% } else if (moduleExists) {%>
            <!-- Module already exists -->
            <p class="zagol">Neue Teilnehmer anlegen</p>
            <p class="txtZur">Teilnehmer Nr <%= tid%>  existiert bereits.</p>
            <p class="txtZur"><a href="NeuTnAnlegen.jsp">Zurück </a></p>

            <% } else if (tstr == null) {%>
            <!-- Step 2: Collect full description and ask about the instructor -->
            <form action="" method="post" class="formOneTab"> 
                <p class="zagol">Neue Teilnehmer anlegen</p>
                 <input type="hidden" name="id" value="<%= tid%>" class="inputTXT">
                 <input type="hidden" name="gend" value="<%= tgend%>" class="inputTXT">
                <input type="hidden" name="name" value="<%= tname%>" class="inputTXT">
                <input type="hidden" name="vname" value="<%= tvname%>" class="inputTXT">
  
                <table class="tableAnketa">
                    <tr> 
                        <th colspan="4"><p class="txtZur">Für Teilnehmer Nr <%= tid%> <%= tname%> <%= tvname%> sind noch folgende Daten zu ergänzen:</p> </th>
                    </tr>
                    <tr>
                        <td colspan="2"  ><label for="str" class="txt14Medium">Strasse und Hausnummer:</label><br>
                        <input type="text" name="str" id="str" class="inputTXT" required ></td><p>
                        <td   ><label for="plz" class="txt14Medium">PLZ:</label><br>
                        <input type="number" min="10000" max="99999" name="plz" id="plz" class="inputTXT" required ></td></p>
                        <td ><label for="ort" class="txt14Medium">Ort:</label><br>
                        <input type="text" name="ort" id="ort" class="inputTXT" required ></td></p>
                    </tr>
                    <tr>
                        <td ><label for="tel" class="txt14Medium">Telefon-Nr:</label><br>
                        <input type="tel" name="tel" id="tel" class="inputTXT" required></td><p>
                        <td  colspan="2" ><label for="email" class="txt14Medium">Email:</label><br>
                        <input type="email" name="email" id="email" class="inputTXT" required ></td>
                        <td  ></td>
                     </tr>

                     
                    <tr>
                        <td><label for="geb" class="txt14Medium">Geb.Datum:</label><br>
                        <input type="date" name="geb" id="geb" class="inputTXT" required ></td><p>
                    <td ><label for="gebort" class="txt14Medium">Geb.Ort:</label><br>
                        <input type="text" name="gebort" id="gebort" class="inputTXT" required ></td></p>
                    <td  colspan="2"><label for="nat" class="txt14Medium">Nationalitaet:</label><br>
                        <input type="text" name="nat" id="nat" class="inputTXT" ></td>
                    <p>
                    </tr>
                    
                    <tr>

                        <td ><label for="abschl" class="txt14Medium">Berater bei AA oder JC:</label><br>
                            <input type="text" name="abschl" id="abschl" class="inputTXT" required ></td></p>
                        <td  ><label for="abschl" class="txt14Medium">AA/JC Kundennummer:</label><br>
                            <input type="text" minlength="10" maxlength="12" name="abschl" id="abschl" class="inputTXT" required ></td></p>

                        <td ><label for="abschl" class="txt14Medium">Schulabschluss:</label><br>
                            <input type="text" name="abschl" id="abschl" class="inputTXT" ></td></p>
                        <td  ><label for="beruf" class="txt14Medium">Beruf:</label><br>
                            <input type="text" name="beruf" id="beruf" class="inputTXT" ></td></p>
                    </tr>

                </table> 
                
                <input type="hidden" name="str" value="<%= tstr%>" class="inputTXT">
                <input type="hidden" name="plz" value="<%= tplz%>" class="inputTXT">
                <input type="hidden" name="ort" value="<%= tort%>" class="inputTXT">

                <input type="hidden" name="tel" value="<%= ttel%>" class="inputTXT">
                <input type="hidden" name="email" value="<%= tmail%>" class="inputTXT">
                <input type="hidden" name="geb" value="<%= tgeb%>" class="inputTXT">
                <input type="hidden" name="gebort" value="<%= tgebort%>" class="inputTXT">
                <input type="hidden" name="nat" value="<%= tnation%>" class="inputTXT">

                <input type="hidden" name="beruf" value="<%= tberuf%>" class="inputTXT">
                <input type="hidden" name="abschl" value="<%= tabschl%>" class="inputTXT">
                <input type="hidden" name="berat" value="<%= tberater%>" class="inputTXT">
                <input type="hidden" name="jc" value="<%= jcNum%>" class="inputTXT"> 
                 <p><button type="submit" class="btnLangFuerAlle">Bestätigen</button></p>
            </form>  
             <% } else if (vertragNr==null) {%>
             <form action="" method="post" class="formOneTab">
                <p class="zagol">Neue Teilnehmer anlegen</p>
                <table class="tableAnketa">
                    <tr> 
                        <th colspan="4"><p class="txtZur">Geben Sie für Teilnehmer Nr <%= tid%> "<%= tname%>", <%= tvname%> bitte die Vertragsdaten ein:</p> </th>
                    </tr>
                    <tr>
                        <td colspan="2"  ><label for="vnr" class="txt14Medium">Vertragsnummer:</label><br>
                        <input type="text" name="vnr" id="vnr" class="inputTXT" required ></td><p>
                    <td  colspan="2" ><label for="kurs" class="txt14Medium">Lehrgang (Kurs):</label><br>
                        <input type="text"  name="kurs" id="kurs" class="inputTXT" required ></td></p>
                    </tr>
                     <tr><td colspan="4"></td></tr>
                </table>     
                <label class="txtZur">Ist die Stammklasse des Teilnehmers schon bekannt?</label>&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" id="y" name="jain" value="y" class="inputRadioOhne" required> 
                            <label for="y" class="labelRadio">Ja</label>&nbsp;&nbsp;
                            <input type="radio" id="n" name="jain" value="n" class="inputRadioOhne" required> 
                            <label for="n" class="labelRadio">Nein</label> 
                            
                <input type="hidden" name="id" value="<%= tid%>" class="inputTXT">
                <input type="hidden" name="gend" value="<%= tgend%>" class="inputTXT">
                <input type="hidden" name="name" value="<%= tname%>" class="inputTXT">
                <input type="hidden" name="vname" value="<%= tvname%>" class="inputTXT">
                <input type="hidden" name="str" value="<%= tstr%>" class="inputTXT">
                <input type="hidden" name="plz" value="<%= tplz%>" class="inputTXT">
                <input type="hidden" name="ort" value="<%= tort%>" class="inputTXT">

                <input type="hidden" name="tel" value="<%= ttel%>" class="inputTXT">
                <input type="hidden" name="email" value="<%= tmail%>" class="inputTXT">
                <input type="hidden" name="geb" value="<%= tgeb%>" class="inputTXT">
                <input type="hidden" name="gebort" value="<%= tgebort%>" class="inputTXT">
                <input type="hidden" name="nat" value="<%= tnation%>" class="inputTXT">

                <input type="hidden" name="beruf" value="<%= tberuf%>" class="inputTXT">
                <input type="hidden" name="abschl" value="<%= tabschl%>" class="inputTXT">
                <input type="hidden" name="berat" value="<%= tberater%>" class="inputTXT">
                <input type="hidden" name="jc" value="<%= jcNum%>" class="inputTXT">
                  <input type="hidden" name="vnr" value="<%= vertragNr%>" class="inputTXT">
                <input type="hidden" name="kurs" value="<%= tkurs%>" class="inputTXT">
                <input type="hidden" name="jain" value="<%= jain%>" class="inputTXT">
                <p><button type="submit" class="btnLangFuerAlle">Bestätigen</button></p>
            </form>

            <% } else if ("y".equalsIgnoreCase(jain)) {%>
            <!-- Step 3: Select a Dozent -->
            <form action="NeuTnUploadVar2.jsp" method="post">
                <p class="zagol">Neue Teilnehmer anlegen</p> 
                <div>
                
                <p class=txtBuch">Wählen Sie ein Klass:</p> 
                
                <% for (Klassen k : klsList) {%>
                <input type="radio" id="kid" name="kid" value="<%= k.getKlassKurz() %>" class="inputRadio" required > <%= k.getKlassKurz()%><br>
                <% } %><p>
                 <input type="hidden" name="id" value="<%= tid%>" class="inputTXT">
                <input type="hidden" name="gend" value="<%= tgend%>" class="inputTXT">
                <input type="hidden" name="name" value="<%= tname%>" class="inputTXT">
                <input type="hidden" name="vname" value="<%= tvname%>" class="inputTXT">
                
                <input type="hidden" name="str" value="<%= tstr%>" class="inputTXT">
                <input type="hidden" name="plz" value="<%= tplz%>" class="inputTXT">
                <input type="hidden" name="ort" value="<%= tort%>" class="inputTXT">

                <input type="hidden" name="tel" value="<%= ttel%>" class="inputTXT">
                <input type="hidden" name="email" value="<%= tmail%>" class="inputTXT">
                <input type="hidden" name="geb" value="<%= tgeb%>" class="inputTXT">
                <input type="hidden" name="gebort" value="<%= tgebort%>" class="inputTXT">
                <input type="hidden" name="nat" value="<%= tnation%>" class="inputTXT">

                <input type="hidden" name="beruf" value="<%= tberuf%>" class="inputTXT">
                <input type="hidden" name="abschl" value="<%= tabschl%>" class="inputTXT">
                <input type="hidden" name="berat" value="<%= tberater%>" class="inputTXT">
                <input type="hidden" name="jc" value="<%= jcNum%>" class="inputTXT">
                <input type="hidden" name="kid" value="<%= klsid%>" class="inputTXT">
                
                <input type="hidden" name="vnr" value="<%= vertragNr%>" class="inputTXT">
                <input type="hidden" name="kurs" value="<%= tkurs%>" class="inputTXT">
                <input type="hidden" name="jain" value="<%= jain%>" class="inputTXT">              
            </div>
                <button type="submit" class="btnLangFuerAlle">Anlegen</button>                
            </form>

            <% } else { %>
            <!-- Final Step: Submit without selecting a Dozent -->
            <form action="NeuTnUploadVar2.jsp" method="post" >
                <p class="zagol">Neue Teilnehmer anlegen</p>
                <input type="hidden" name="id" value="<%= tid%>" class="inputTXT">
                <input type="hidden" name="gend" value="<%= tgend%>" class="inputTXT">
                <input type="hidden" name="name" value="<%= tname%>" class="inputTXT">
                <input type="hidden" name="vname" value="<%= tvname%>" class="inputTXT">

                
                <input type="hidden" name="str" value="<%= tstr%>" class="inputTXT">
                <input type="hidden" name="plz" value="<%= tplz%>" class="inputTXT">
                <input type="hidden" name="ort" value="<%= tort%>" class="inputTXT">

                <input type="hidden" name="tel" value="<%= ttel%>" class="inputTXT">
                <input type="hidden" name="email" value="<%= tmail%>" class="inputTXT">
                <input type="hidden" name="geb" value="<%= tgeb%>" class="inputTXT">
                <input type="hidden" name="gebort" value="<%= tgebort%>" class="inputTXT">
                <input type="hidden" name="nat" value="<%= tnation%>" class="inputTXT">

                <input type="hidden" name="beruf" value="<%= tberuf%>" class="inputTXT">
                <input type="hidden" name="abschl" value="<%= tabschl%>" class="inputTXT">
                <input type="hidden" name="berat" value="<%= tberater%>" class="inputTXT">
                <input type="hidden" name="jc" value="<%= jcNum%>" class="inputTXT">
                <input type="hidden" name="kid" value="-1" class="inputTXT">
                <input type="hidden" name="vnr" value="<%= vertragNr%>" class="inputTXT">
                <input type="hidden" name="kurs" value="<%= tkurs%>" class="inputTXT">
                <input type="hidden" name="jain" value="<%= jain%>" class="inputTXT">
                <p class=txtZur">Teilnehmer Nr <%= tid %>: <%=tname%>, <%= tvname%> wird ohne Klasse angelegt.</p>
                
                <button type="submit" class="btnLangFuerAlle">Anlegen</button>
              
            </form>
            <p class="txtZur"><a href="NeuTnAnlegenVar2.jsp"> << Zurück</a></p>
            <% }%>
            
        </div>

    </body>
</html>
