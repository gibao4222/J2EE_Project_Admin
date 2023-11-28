<%-- 
    Document   : index2
    Created on : Nov 28, 2023, 3:28:57 PM
    Author     : Thanhchan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="component-ui/header.jsp" %>

   <style type="text/css">
    
    button.stylinggg {
        display: inline-block;
  padding: 3px 9px;
  font-size: 15px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
}
  button.stylinggg:hover {background-color: #3e8e41}
  button.stylinggg:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}



</style> 
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
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
                        <h2>Thông tin mua hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="home">Trang chủ</a>
                            <span>Thông tin mua hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sản phẩm</th>

                                    <th>Giá</th>
                                    
                                    
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                  <c:forEach items="${details}" var="v"> 

                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="./resources/image/<c:out value="${v.img}"/>" width="70"? alt="">
                                        <h5>${v.namePro}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                       <fmt:formatNumber value="${v.price}" pattern="#,###" />
                    VNĐ
                                    </td>
                                    <td class="shoping__cart__price">
                                       ${v.quantity} 
                                    </td>
                                    

                                    <td class="shoping__cart__total">
                                        <fmt:formatNumber value="${v.total}" pattern="#,###" /> VNĐ
                                    </td>
                                   
                                </tr>
                            
                                                        </c:forEach>

                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="home" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@include file="component-ui/footer.jsp" %>

