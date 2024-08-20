<%-- 
    Document   : ModulAnlegen
    Created on : 20.08.2024, 14:59:40
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

            <form action="ModuleUpload.jsp" method="post">
                <br>
                <p class="zagol">Neue Module anlegen</p>
                <table class="tabKlein">
                    <tr class="txtZur">
                        <th colspan="2"><label >Geben Sie bitte ein:</label> <p></th>
                    </tr>
                    <tr class="txtZur">
                  
                        <td colspan="2">
                            <label for="dat" >Datum waelen:</label>
                            <input type="date" name="dat" id="dat" class="selGross"><br><br>
                        </td>
                       
                    </tr>
                   
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">Module anzeigen</button> <p>
                        </td>   </tr>  
                    <tr>
                        <td>
                            <a href="Home.jsp" class="txtZur"> << Menu</a></p>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
