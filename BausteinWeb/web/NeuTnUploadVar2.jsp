<%-- 
    Document   : NeuTnUploadVar2
    Created on : 28.08.2024, 14:23:39
    Author     : EWorster
--%>

<%@page import="session.BeanConnector"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    // Retrieve parameters from the request
                    String tid = request.getParameter("id");
                    String tgend=request.getParameter("gend");
                    String tname = request.getParameter("name");
                    String tvname = request.getParameter("vname");
                    String tstr = request.getParameter("str");
                    String tplz = request.getParameter("plz");
                    String tort = request.getParameter("ort");
                    String ttel = request.getParameter("tel");
                    String tmail = request.getParameter("email");
                    String geb = request.getParameter("geb");
                    String tgebort = request.getParameter("gebort");
                    String tnation = request.getParameter("nat");
                    String tberuf = request.getParameter("beruf");
                    String tabschl = request.getParameter("abschl");
                    String tberater = request.getParameter("berat");
                    String jcNum = request.getParameter("jc");
                    
                    String vertragNr = request.getParameter("vnr");
                    String tkurs = request.getParameter("kurs");
                    String gelten = request.getParameter("gilt");
                    
                    String klsid = request.getParameter("kid"); 
                   SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                   SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");

                   Date dateUse = inputFormat.parse(geb);
                   String tgeb = outputFormat.format(dateUse);  %>     
    
                   
           <% try{
              beanCon.invokeBean().tnEinHinzu(tid, tgend, tname,tvname, tstr, tplz, tort, ttel, tmail, tgeb, tgebort, tnation, tberuf, tabschl, tberater, jcNum,  klsid);
           %> 
               <p class="txtBuch">Teilnehmer <%=tname %> <%=tvname%> wurde angelegt<p>
                   
               <%}catch(Exception e){
               e.printStackTrace();
               }%>
               
               
               <% try{
                    beanCon.invokeBean().addVertrag(vertragNr, tkurs, gelten, tid); 
                   %>
                    <p class="txtBuch">Vertrag <%=vertragNr %>  wurde angelegt<p>
                    <%}catch(Exception e){
               e.printStackTrace();
               }%>
            <p>
                <a href="Home.jsp" class="txtZur"> << Zurück </a><p>
        </div>
    </body>
</html>
