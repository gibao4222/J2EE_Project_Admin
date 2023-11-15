<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Lịch sử đơn hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .order-container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            margin: 20px auto;
            max-width: 600px;
            padding: 20px;
        }

        .order-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-id {
            font-weight: bold;
            color: #333;
        }

        .order-total {
            font-weight: bold;
        }

        .order-date {
            color: #777;
        }

        .order-status {
            font-weight: bold;
            text-transform: uppercase;
        }

        .order-details-button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin-top: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .order-details-button:hover {
            background-color: #45a049;
        }
    </style>
    
</head>
<body>
    
    <h1>Lịch sử đơn hàng</h1>
    <div class="order-container">
        <c:forEach items="${Order}" var="v">
        <div class="order-item">
            <div class="order-details">
                <span class="order-id">ID Đơn hàng:${v.idOrder}</span>
                <span class="order-total">Tổng tiền:  <fmt:formatNumber value="${v.totalBill}" pattern="#,###" />
                    VNĐ</span>
            </div>
            <div class="order-details">
                <span class="order-date">Ngày tạo đơn: ${v.dateCreated}</span>
                <span class="order-status"> <c:choose>
                            <c:when test="${v.status eq 0}">
                                Đã xử lí
                            </c:when>
                            <c:otherwise>
                                Chưa xử lí
                            </c:otherwise>
                        </c:choose></span>
            </div>
                <form action="checkout" method="post">
                    <input type="hidden" name="action" value="detailsOrder">
                    <input type="hidden" name="idOrder" value="${v.idOrder}">

                        
           <button id="order-details-button" data-order-id="123" class="order-details-button">Xem chi tiết</button>
           </form>
        </div>
        </c:forEach>
    </div>
    <div class="shoping__cart__btns">
                        <a href="home" class="primary-btn cart-btn">Quay lại</a>
                        
                    </div>
</body>
</html>


