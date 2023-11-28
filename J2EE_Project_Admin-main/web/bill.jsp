<%-- 
    Document   : bill
    Created on : Nov 28, 2023, 10:11:48 PM
    Author     : Thanhchan
--%>


<%-- 
    Document   : index2
    Created on : Nov 28, 2023, 3:28:57 PM
    Author     : Thanhchan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="component-ui/header.jsp" %>

    <style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  font-size: 16px;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 20px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 20px;
  padding-bottom: 22px;
  text-align: left;
  background-color: #7FAD39;
  color: white;
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
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Thương hiệu</span>
                    </div>
                    <ul>
                             <?php
                        $show = $brand->show_brand();
                        if($show){
                           
                            while($result = $show->fetch_assoc()){
                         ?>      
                        <li><a href="product.php?brandid=<?php echo $result['brandId'] ?>,&brandName=<?php echo $result['brandName'] ?>"><?php echo $result['brandName'] ?></a></li>
                        <?php 
                            }
                        }
                         ?>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="product.php" method="GET">
                                <!-- <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div> -->

                                <input type="text" name="namepro" placeholder="What do yo u need?">
                                <button type="" class="site-btn">SEARCH</button>

                            </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 11.188.888</h5>
                            <span>Hổ trợ 24/7 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./resources/img2/background.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Đơn hàng của bạn</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.php">-Trang chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        
        <div class="checkout__form">
            <h4>Hóa đơn chi tiết</h4>
            <div class="row">
                <table id="customers" width="100%">
                    <tr>
                        <th>ID Đơn hàng</th>
                        <th>Ngày</th>
                        
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Chi tiết</th>
                    </tr>
                   <c:forEach items="${Order}" var="v">
                    <tr>
                        <td>${v.idOrder}</td>
                        <td> ${v.dateCreated}</td>
                        <td><fmt:formatNumber value="${v.totalBill}" pattern="#,###" />
                    VNĐ</td>
                        <td> <c:choose>
                            <c:when test="${v.status eq 0}">
                                Đã xử lí
                            </c:when>
                            <c:otherwise>
                                Chưa xử lí
                            </c:otherwise>
                        </c:choose></td>
                        
                        
                        
                        <td><form action="checkout" method="post">
                    <input type="hidden" name="action" value="detailsOrder">
                    <input type="hidden" name="idOrder" value="${v.idOrder}">

                        
           <button id="order-details-button" data-order-id="123" class="order-details-button">Xem chi tiết</button>
           </form></td>
                    </tr>
                            </c:forEach>

                </table>
            </div>
        </div>
    </div>
</section>
   
<%@include file="component-ui/footer.jsp" %>
