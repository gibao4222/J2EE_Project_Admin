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

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">BUG SHOP <sup></sup></div>
  </a>
  <!-- Divider -->
  <hr class="sidebar-divider my-0">

  <!-- Nav Item - Dashboard -->
  <li class="nav-item active">
    <a class="nav-link" href="index.php">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Trang Chính</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        <i class="fas fa-money-bill-alt"></i>
        <span>Quyền</span>
      </a>
      <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header"> Phân quyền :</h6>
          <a class="collapse-item" href="">Quyền</a>
          <a class="collapse-item" href="">Nhóm quyền</a>

        </div>
 
      </div>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">
      Quản Lý
    </div>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-money-bill-alt"></i>
        <span>Thanh Toán</span>
      </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header"> Đơn Hàng :</h6>
          <a class="collapse-item" href="">Danh Sách Đơn Hàng</a>
          <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header"> Nhập Hàng :</h6>
          <a class="collapse-item" href="">Danh Sách Nhập Hàng</a>

        </div>
 
      </div>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="">
        <i class="fas fa-users-cog"></i>
        <span>Danh Sách Nhân Sự</span></a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="">
        <i class="fas fa-users-cog"></i>
        <span>Danh Sách Khách Hàng</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-plus"></i>
          <span>Quản Lý Sản Phẩm</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Thông Tin :</h6>
            <a class="collapse-item" href="">Nhà Sản Xuất</a>
            <a class="collapse-item" href="">Danh Sách Sản Phẩm</a>
            <a class="collapse-item" href="">Danh Mục Sản Phẩm</a>
            <a class="collapse-item" href="">Chương Trình Khuyến Mãi</a>
          </div>
        </div>
        </li>
        
<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-none d-md-inline">
  <button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>

</ul>
        
        
        
        
        <%@include file ="listCategory.jsp" %>
        
        
        
        
        
        
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
