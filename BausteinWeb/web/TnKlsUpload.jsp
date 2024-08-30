<%-- 
    Document   : TnKlsUpload
    Created on : 29.08.2024, 13:45:13
    Author     : EWorster
--%>

<%@page import="session.BeanConnector"%>
<%@page import="service.BauService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TN-Klasse hinzufuegen</title>
     <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            <%
                BauService bauSer = new BauService();
                String tnid= request.getParameter("id");
                String klass = request.getParameter("kls");
               // String geb = request.getParameter("gebTN");
                try {
                    BeanConnector beanCon = new BeanConnector();     
            %>
          
              
            <% beanCon.invokeBean().addTnZuKls(klass, tnid); %>
           
            <p class="txtBuch">Teilnehmer wurde zugefügt<p>

                <%  /*response.sendRedirect("http://localhost:8080/BausteinWeb/Home.jsp");*/
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("Nicht geklapt!!! Keine Ahnung warum");
                    }
                %>

            <p>
                <a href="Home.jsp" class="txtZur"> << Menu </a><p>

        </div>
    </body>
</html>