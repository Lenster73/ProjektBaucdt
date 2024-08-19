<%-- 
    Document   : TerminUpload
    Created on : 06.08.2024, 12:42:37
    Author     : EWorster
--%>
<%@page import="java.util.List"%>
<%@page import="service.BauService"%>
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
                BauService bauSer = new BauService();
                String startDat = request.getParameter("startD");
                String endeDat = request.getParameter("endeD");
                String klass = request.getParameter("kls");
                String modul = request.getParameter("modul");
                try {
                    BeanConnector beanCon = new BeanConnector();     
            %>
          
              
            <% beanCon.invokeBean().ersetzDatumDB(klass, modul, startDat, endeDat); %>
           
            <p class="txtBuch">Datei wurde geaendert</h2><p>

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
