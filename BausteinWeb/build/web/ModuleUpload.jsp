<%-- 
    Document   : ModuleUpload
    Created on : 20.08.2024, 15:01:24
    Author     : EWorster
--%>

<%@page import="entity.Dozent"%>
<%@page import="entity.Baustein"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="session.BeanConnector"%>
<%@page import="service.BauService"%>
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
                BeanConnector beanCon = new BeanConnector();
                List<Baustein> bauList = beanCon.invokeBean().getBau();
                List<Dozent> dozList = beanCon.invokeBean().getDoz();

                    // Retrieve parameters from the request
                    String bauidUse = request.getParameter("bauid");
                    String tagUse = request.getParameter("tag");
                    String besch = request.getParameter("besch");
                  
                    String selectedDozentId = request.getParameter("did");
                try {
                         
            %>
          
              
            <% beanCon.invokeBean().addNeueBauDB(bauidUse, tagUse, besch, selectedDozentId); %>
           
            <p class="txtBuch">Neue Modul wurde angelegt<p>

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