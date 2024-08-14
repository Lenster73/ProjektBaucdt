<%-- 
    Document   : DateiUpload
    Created on : 01.08.2024, 12:58:21
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
                String fNameDat = request.getParameter("file");
                int punktIndex = fNameDat.lastIndexOf('.');
                String klname = "";
                String bauDat = "";
                if (punktIndex != -1) {
                    klname = fNameDat.substring(0, punktIndex);
                }
                try {
                    BeanConnector beanCon = new BeanConnector();
                    List<String> alltxt = beanCon.invokeBean().txtDatModAus(fNameDat);

                    List<String> datum = beanCon.invokeBean().addDatum(alltxt);

                    /*for (int i = 0; i < datum.size(); i++) {
                        System.out.println(datum.get(i));
                    }

                    System.out.println(klname);*/
                    beanCon.invokeBean().addDatumBauManyDB(datum, klname);

            %>
            <h2>Datei wurde hinzugefügt</h2><p>

                <%  response.sendRedirect("http://localhost:8080/BausteinWeb/Home.jsp");
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("Die Rechnung wurde schon angelegt. Wählen Sie bitte andere Datei");
                    }

                %>

            <p><a href="Home.jsp"> << Menu </a><p>

        </div>

    </body>
</html>
