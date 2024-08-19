<%-- 
    Document   : TnUpload
    Created on : 13.08.2024, 10:58:34
    Author     : EWorster
--%>

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
                String nname = request.getParameter("nameTN");
                String vname = request.getParameter("vornameTN");
                String klass = request.getParameter("kls");
                String geb = request.getParameter("gebTN");
                try {
                    BeanConnector beanCon = new BeanConnector();     
            %>
          
              
            <% beanCon.invokeBean().addTnKls(klass, nname, vname, geb); %>
           
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
