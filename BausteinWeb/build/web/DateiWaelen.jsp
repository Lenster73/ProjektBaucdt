<%-- 
    Document   : DateiWaelen
    Created on : 01.08.2024, 13:00:29
    Author     : EWorster
--%>

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
            <p class="zagol">Datei waehlen</p>
            <form action="DateiUpload.jsp" method="post">
                <table class="tabKlein">
                    <tr>
                        <th colspan="2"><label class="txtBuch">Wählen Sie eine Datei:</label></th>
                        <th></th>              
                    </tr>
                    <tr>
                        <td colspan="3"><input type="file" name="file" id="file" accept=".txt, .CSV" class="dateiGross"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><button type="btn" class="btn"><input type="submit" value="Upload" class="inpBTN"></button></td></td>
                    </tr>
                    <tr>
                        
                        <td><a href="Home.jsp"> << Menu</a></tr>
                    
                    </tr>
            </form>
        </div>
    </body>
</html>
