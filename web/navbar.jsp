<%-- 
    Document   : navbar
    Created on : Oct 11, 2023, 8:40:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <a class="collapse-item" href="permission.jsp">Nhóm quyền</a>

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