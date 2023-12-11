<%-- 
    Document   : detailsproduct
    Created on : Oct 30, 2023, 9:32:03 PM
    Author     : Thanhchan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@include file="component-ui/header.jsp" %>

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
                            
                        <li><a href="product.php?brandid=<?php echo $result['brandId'] ?>,&brandName=<?php echo $result['brandName'] ?>"><?php echo $result['brandName'] ?></a></li>
                        
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
<!--    <section class="breadcrumb-section set-bg" data-setbg="img/background.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Product's Package</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html">Products</a>
                            <span>Product's Package</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <form action="" method="post">  
    

    <section class="product-details spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="./resources/image/<%=   request.getAttribute("img") %>" alt="">
                        </div>
                         <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="./resources/img/undraw_posting_photo.svg"
                                src="./resources/img/undraw_posting_photo.svg" alt="">
                            <img data-imgbigurl="./resources/img/undraw_posting_photo.svg"
                                src="./resources/img/undraw_posting_photo.svg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                src="./resources/img/undraw_posting_photo.svg" alt="">
                            <img data-imgbigurl="./resources/img/undraw_posting_photo.svg"
                                src="./resources/img/undraw_posting_photo.svg" alt="">
                        </div> 
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=   request.getAttribute("nameproduct") %></h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price"><fmt:formatNumber value="<%=   request.getAttribute("price") %>" pattern="#,###" /> VNĐ </div>
                        <p><%=   request.getAttribute("introduce") %></p>
                         
                           
                        
                       
                       
                        <!-- <a  class="primary-btn" name="submit">ADD TO CARD</a> -->
                        <button type="submit" class="site-btn" name="submit">ADD TO CARD</button>
                        
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            
                            <li><b>Availability</b>
                                
                          <%
    // Lấy giá trị từ attribute "quantities"
    Object quantitiesObject = request.getAttribute("quantities");

    // Kiểm tra xem giá trị có tồn tại và có phải là một số không
    if (quantitiesObject != null && quantitiesObject instanceof Number) {
        int quantity = ((Number) quantitiesObject).intValue();

        // Bây giờ bạn có thể sử dụng biến quantity
        if (quantity > 0) {
%>
            <span>In Stock</span>
<%
        } else {
%>
           <span>Out Stock</span>
<%
        }
    } else {
%>
        <p>Không thể lấy giá trị hoặc giá trị không phải là số</p>
<%
    }
%>
                            </li>
                            
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>



                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Thông tin chi tiết</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p>Enjoy luxurious comfort and improved bounce with the men's GEL-KAYANO® 26 running shoe, featuring GEL® technology to the forefoot and rear for high-density shock absorption and a comfortable feel over long distances. Featuring a jacquard mesh upper and FLYTEFOAM® Propel technology for a lightweight quality that allows your feet to breathe, this ASICS running shoe is all about going the distance, providing exceptional support and comfort over long periods of time. The EVA sockliner offers excellent rebound and cushioning, while the Guidance TRUSSTIC SYSTEM® technology brings a new level of stability, working with the contoured midsole to help control torsion. Meanwhile, the SpEVA 45 lasting improves bounce-back characteristics to put a spring in your step (quite literally).</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p>Enjoy luxurious comfort and improved bounce with the men's GEL-KAYANO® 26 running shoe, featuring GEL® technology to the forefoot and rear for high-density shock absorption and a comfortable feel over long distances. Featuring a jacquard mesh upper and FLYTEFOAM® Propel technology for a lightweight quality that allows your feet to breathe, this ASICS running shoe is all about going the distance, providing exceptional support and comfort over long periods of time. The EVA sockliner offers excellent rebound and cushioning, while the Guidance TRUSSTIC SYSTEM® technology brings a new level of stability, working with the contoured midsole to help control torsion. Meanwhile, the SpEVA 45 lasting improves bounce-back characteristics to put a spring in your step (quite literally).</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p>Enjoy luxurious comfort and improved bounce with the men's GEL-KAYANO® 26 running shoe, featuring GEL® technology to the forefoot and rear for high-density shock absorption and a comfortable feel over long distances. Featuring a jacquard mesh upper and FLYTEFOAM® Propel technology for a lightweight quality that allows your feet to breathe, this ASICS running shoe is all about going the distance, providing exceptional support and comfort over long periods of time. The EVA sockliner offers excellent rebound and cushioning, while the Guidance TRUSSTIC SYSTEM® technology brings a new level of stability, working with the contoured midsole to help control torsion. Meanwhile, the SpEVA 45 lasting improves bounce-back characteristics to put a spring in your step (quite literally).</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
<%@include file="component-ui/footer.jsp" %>

