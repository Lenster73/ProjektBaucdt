<%-- 
    Document   : DatumWaelen
    Created on : 09.08.2024, 11:15:25
    Author     : EWorster
--%>

<%@page import="entity.Baustein"%>
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
        <div>

            <form action="DatumBauAnzeigen.jsp" method="post">
                <p class="zagol">Alle Module fuer den Tad</p>
                <table class="tabKlein">
                    <tr>
                        <th colspan="2"><label class="txtBuch">Geben Sie bitte ein Datum ein:</label> <p></th>
                    </tr>
                    <tr>
                  
                        <td colspan="2">
                            <label for="dat" class="txtBuch">Datum waelen:</label>
                            <input type="date" name="dat" id="dat" class="selGross"><br><br>
                        </td>
                       
                    </tr>
                   
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Module anzeigen</button> <p>
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
