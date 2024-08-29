<%-- 
    Document   : TnLoeschen
    Created on : 20.08.2024, 11:15:53
    Author     : EWorster
--%>

<%@page import="entity.Teilnehmer"%>
<%@page import="java.util.List"%>
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
        <div ><a href="index.html"><img src="CDT-Logo.png" alt="Logo CDT" class="logo"></a></div>
        <div>
            <%
                BeanConnector beanCon = new BeanConnector();
                String tnId = request.getParameter("id");
                try {           
            %>
          
              
            <% beanCon.invokeBean().delTn(tnId); %>
           
            <p class="txtBuch">Teilnehmer wurde gelöschmarkiert<p>

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
