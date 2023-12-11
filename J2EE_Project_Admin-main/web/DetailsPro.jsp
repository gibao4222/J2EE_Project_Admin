<%-- 
    Document   : detailsproduct
    Created on : Oct 30, 2023, 9:32:03 PM
    Author     : Thanhchan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@include file="component-ui/header.jsp" %>
  <style>
       img.product__details__pic__item--large {
    height: 500px;
    width: 200px;
}
img.sub-galerry {
    height: 130px;
}
    </style>
   
  <section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
               <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Danh mục sản phẩm</span>
                        </div>
                                                         <c:forEach items="${cate}" var="cate">

                        <ul>

                            <li><a href="categoryHome?idCategory=<c:out value="${cate.idCategory}"/>">${cate.nameCategory}</a></li>
                            
                        </ul>
               </c:forEach>
                       
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
    <form action="ShoppingCartServlet" method="GET">
    

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
                              <c:forEach items="${sub}" var="c">
                            <img data-imgbigurl="./resources/image/<%=   request.getAttribute("img") %>"
                <img class="sub-galerry" src="./resources/image/<c:out value="${c.subImage}"/>" alt="Product Image 1">
                            </c:forEach>
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
                         
                           
                        
                       
                       
                         
                        
                        
                <input name="quantity" type="hidden" min="1" value="1" />
                <input type="hidden" name="action" value="AddCart">
                                <input type="hidden" name="price" value="<%=   request.getAttribute("price") %>" />    
                                <input type="hidden" name="image" value="<%=   request.getAttribute("img") %>" />    

                <input type="hidden" name="nameproduct" value="<%=   request.getAttribute("nameproduct") %>" />    
           <input type="hidden" name="action" value="add" />
            <input type="hidden" name="idProduct" value="<%=   request.getAttribute("IdProduct") %>"/>
                <input  type="submit" class="buy-button primary-btn" value="Mua hàng" />
         </form>
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
                                    <p><%=request.getAttribute("portray")%></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p><%=request.getAttribute("portray")%></p>
                                    </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Thông tin sản phẩm</h6>
                                    <p><%=request.getAttribute("portray")%></p>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
<%@include file="component-ui/footer.jsp" %>

