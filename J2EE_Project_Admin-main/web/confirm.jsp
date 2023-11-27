<%-- 
    Document   : confirm
    Created on : Nov 6, 2023, 2:36:39 PM
    Author     : Thanhchan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
  <title>Xác nhận đơn hàng</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="./resources/css/styleComponent.css">
<link rel="stylesheet" href="./resources/css/sb-admin-2.css">
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="./resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css">
<link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <style>
    /* CSS để tạo bố cục và kiểu dáng */
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
    }

    .customer-info {
      margin-bottom: 20px;
    }

    .cart {
      background-color: #f5f5f5;
      padding: 20px;
      margin-bottom: 20px;
    }

    .cart-item {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .product-image {
     margin-top:60px;
      width: 80px;
      height: 80px;
      margin-right: 10px;
    }

    .product-details {
      flex-grow: 1;
    }

    .total-price {
      font-size: 20px;
      font-weight: bold;
    }

    .discount-input {
      margin-bottom: 10px;
    }

    .discount-btn {
      margin-left: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-md-6 customer-info">
        <h2>Thông tin khách hàng</h2>
        <p><strong>Họ và tên:</strong>${fullname}</p>
        <p><strong>Số điện thoại:</strong> ${phone}</p>
        <p><strong>Địa chỉ:</strong>${address}</p>
        <p><strong>Email:</strong>${email}</p>
        
                    <div class="shoping__cart__btns">
                        <a href="show-cart" class="primary-btn cart-btn">Quay lại</a>
                        
                    </div>
      </div>
      <div class="col-md-6 cart">
          <c:set value="${cart.totalPrice}" var="p" />
          <c:set value="${discount}" var="s"/>
        <h2>Xem lại giỏ hàng</h2>
        <c:forEach items="${cart.items}" var="item">
        <div class="cart-item">
          <img class="product-image" src="./resources/image/<c:out value="${item.image}" />" alt="Sản phẩm 1">
          <div class="product-details">
            <p><strong>Sản phẩm 1:</strong>${item.tenSanPham}</p>
            <p><strong>Số lượng:</strong>${item.quantity}</p>
            <p><strong>Giá:</strong>  <fmt:formatNumber value="${item.gia}" pattern="#,###" /></p>
          </div>
        </div>
                                       </c:forEach>

        
        <div class="total-price">Tổng giá: <fmt:formatNumber value="${p}" pattern="#,###" />VNĐ</div>
       <div class="shoping__discount">
           
                            <h5>Discount Codes</h5>
                            <form action="ShoppingCartServlet" method="get">
                                
                                <input type="hidden" name="action" value="coupon">
                                <input type="hidden" name="totalprice" value="${p}">
                                <input type="hidden" name="idcustomer" value="3" />
                                <input type="text" name="coupon" placeholder="Enter your coupon code">
                                <button type="submit" name="discount" class="site-btn">APPLY COUPON</button>
                                <!-- <button type="submit" name="undiscount" class="site-btn">APPLY COUPON</button> -->
                            </form>
                                <h5 style="color: red">${note}</h5>
                        </div>
        <div class="total-price">Giá sau khi giảm giá:  <fmt:formatNumber value="${p-s}" pattern="#,###" />VNĐ</div>
        <form action="checkout" method="POST"
               <%
        String id = (String) session.getAttribute("idCustomer");
    %>
                            <input type="hidden" name="total" value="${p-s}"/>
                             <input type="hidden" name="idCustomer" value="<%= id %>"/>
                        <input type="hidden" name="total" value="${p-s}"/>
                             <input type="hidden" name="action" value="confirm"/>

                        <input type="submit" class="primary-btn cart-btn" value="xác nhận đơn hàng"/>
                        </form>
      </div>
    </div>
  </div>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>