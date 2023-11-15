<%-- 
    Document   : test
    Created on : Nov 10, 2023, 1:58:44 AM
    Author     : Thanhchan
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
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
  <title>Show Chi tiết đơn hàng</title>
  <style>
    /* CSS */
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
      margin-top: 0;
    }

    .product {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
    }

    .product img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      margin-right: 10px;
    }

    .product-info {
      flex-grow: 1;
    }

    .product-info h2 {
      margin: 0;
      font-size: 18px;
      color: #333;
    }

    .product-info p {
      margin: 0;
      color: #777;
      margin-bottom: 5px;
    }

    .product-price {
      font-weight: bold;
      color: #333;
      font-size: 18px;
    }

    .total-price {
      text-align: right;
      font-size: 20px;
      margin-top: 30px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Chi tiết đơn hàng</h1>
    <c:forEach items="${details}" var="v"> 

    <div class="product">
      <img src="./resources/image/<c:out value="${v.img}"/>">
      <div class="product-info">
        <h2>${v.namePro}</h2>
        <p>Giá: <fmt:formatNumber value="${v.price}" pattern="#,###" />
                    VNĐ</p>
        <p>Số lượng:${v.quantity} </p>
      </div>
      <div class="product-price"><fmt:formatNumber value="${v.total}" pattern="#,###" /> VNĐ</div>
    </div>
</c:forEach>
   

    
  </div>
<div class="shoping__cart__btns">
                        <a href="home" class="primary-btn cart-btn">Quay lại</a>
                        
                    </div>
  <script>
    // JavaScript
    // Có thể thêm mã JavaScript tại đây nếu cần thiết
  </script>
</body>
</html>