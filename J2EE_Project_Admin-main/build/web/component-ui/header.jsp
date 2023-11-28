<%-- 
    Document   : header
    Created on : Nov 28, 2023, 3:05:10 PM
    Author     : Thanhchan
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>BUG SHOP</title>

    <!-- Google Font -->
   <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css2/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css2/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> contact@bugshop.com</li>
                                <li>Miễn phí giao hàng cho hóa đơn từ 99$</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            
                                          
                                 <div class="header__top__right__social">
                                     <a href="register.php"><i ></i> Đăng ký</a>
                                 </div>   
                             <c:choose>
                    <c:when test="${empty sessionScope.name}">
                        <div class="header__top__right__auth">
                                <a href="login.jsp  "><i class="fa fa-user"></i> Login</a>
                                       
                            </div>
                    </c:when>
                    <c:otherwise>
                       <a href="logout"><i class="fa fa-user"></i> Logout</a>
                    </c:otherwise>
                </c:choose>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.php"><img src="resources/img2/3.png" alt="" ></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="home">Trang chủ</a></li>
                            <li><a href="./product.php">Sản phẩm</a></li>
                            
                             <%
        String id = (String) session.getAttribute("idCustomer");
        if(id!=null){
    %>
                           <li><a href="info">Thông tin </a></li>;
                                   <li><a href="Ordercustomer?idCustomer=<%= id %>">Đơn hàng</a></li>;
                                   <% }else{

} %>
                                                        
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="show-cart"><i class="fa fa-shopping-bag"></i> <span>
                                </span></a></li>
                        </ul>
                        <div class="header__cart__price"> <span>
                           </span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    

    