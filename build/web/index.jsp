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
        <link rel="stylesheet" href="./resources/css/sb-admin-2.css">
        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style>
        <script src="chrome-extension://ajdpfmkffanmkhejnopjppegokpogffp/assets/prompt.js"></script>
    </head>
    <body>
        <!--                                                                 Header                                                                      -->
        <%
            HeaderComponent header = new HeaderComponent("Dashboard","header");
            String headerHTML =header.generateHTML();
            
        %>
        <%=headerHTML%>

        <!-- Sidebar -->


        
        <%@include file ="navbar.jsp" %>
        
        
        <%@include file ="permission.jsp" %>
        
        
        
        
        
        
        <script src="./resources/js/script.js"></script>
        
        <!-- Bootstrap core JavaScript-->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <!--<script src="./resources/vendor/chart.js/Chart.min.js"></script>-->

  <!-- Page level custom scripts -->
  <!--<script src="./resources/js/demo/chart-area-demo.js"></script>-->
  <!--<script src="./resources/js/demo/chart-pie-demo.js"></script>-->
    </body>
</html>
