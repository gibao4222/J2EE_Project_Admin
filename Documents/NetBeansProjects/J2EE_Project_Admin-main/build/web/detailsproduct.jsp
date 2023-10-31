<%-- 
    Document   : detailsproduct
    Created on : Oct 30, 2023, 9:32:03 PM
    Author     : Thanhchan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .product {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .product-image {
            flex: 0 0 50%;
            max-width: 50%;
            text-align: center;
        }

        .product-image img {
            max-width: 100%;
            height: auto;
        }

        .product-info {
    flex: 0 0 50%;
    max-width: 50%;
    padding-left: 40px;
    margin-left: 220px;
}

        .product-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 20px;
            color: #e91e63;
            margin-bottom: 10px;
        }

        .product-category {
            font-size: 16px;
            color: #777;
            margin-bottom: 10px;
        }

        .product-quantity {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .product-gallery {
            margin-top: 20px;
            text-align: center;
        }

        .product-image img {
    max-width: 100%;
  
    height: 200px;
    margin-left: 333px;
   
    border-radius: 15px;
}
img.sub-galerry {
    height: 150px;
}
        .buy-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px 20px;
            text-align: center;
            font-size: 18px;
            color: #fff;
            background-color: #e91e63;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chi tiết sản phẩm</h1>
        
        <div class="product">
            <div class="product-image">
                <img src="./resources/image/<%=   request.getAttribute("img") %>" alt="Product Image">
            </div>
            <div class="product-info">
                <h2 class="product-title">Tên sản phẩm: <%=   request.getAttribute("nameproduct") %> </h2>
                <p class="product-price">Giá sản phẩm:<fmt:formatNumber value="<%=   request.getAttribute("price") %>" pattern="#,###" /> VNĐ </p>
                
                <p class="product-quantity">Số lượng:<%=   request.getAttribute("quantity") %></p>
               
            </div>
        </div>
        <div class="product-gallery">
            <c:forEach items="${sub}" var="c">
                <img class="sub-galerry" src="./resources/image/<c:out value="${c.subImage}"/>" alt="Product Image 1">
            
            </c:forEach>
            <!-- Thêm các hình ảnh phụ khác -->
        </div>
         <a href="#" class="buy-button">Mua hàng</a>
         
    </div>
</body>
</html>
