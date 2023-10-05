<%-- 
    Document   : index.jsp
    Created on : Sep 28, 2023, 9:33:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="components.HeaderComponent"%>
<%@page import="components.TableComponent" %>
<%@page import="components.ButtonComponent" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./resources/css/styleComponent.css">
        <link rel="stylesheet" href="./resources/css/styleLogin.css">
    </head>
    <body>
        <!--                                                                 Header                                                                      -->
        <%
            HeaderComponent header = new HeaderComponent("Dashboard","header");
            String headerHTML =header.generateHTML();
            
        %>
        <%=headerHTML%>
        <br>
        <br>
        <br>
        <br>
        <br>

        <%
            ButtonComponent button = new ButtonComponent("CC","btn");
            String buttonHTML = button.generateHTML();
        %>
        <%=buttonHTML%>
        
        
        <script src="./resources/js/script.js"></script>
    </body>
</html>
