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
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            
            
            <form action="DateiUpload.jsp" method="post"><br>
               <p class="zagol">Datei waehlen</p>
                <table class="tabKlein">
                    <tr class="txtZur">
                        <th colspan="2"><label >Wählen Sie eine Datei:</label></th>
                        <th></th>              
                    </tr>
                    <tr>
                        <td colspan="3"><input type="file" name="file" id="file" accept=".txt, .CSV" class="dateiGross"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><button type="btn" ><input type="submit" value="Upload" class="inpBTN"></button></td></td>
                    </tr>
                    <tr>
                        
                        <td><a href="Home.jsp" class="txtZur"> << Menu</a></tr>
                    
                    </tr>
            </form>
        </div>
    </body>
</html>
