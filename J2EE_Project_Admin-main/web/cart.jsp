<%-- 
    Document   : cart
    Created on : Oct 18, 2023, 1:59:18 PM
    Author     : Admin
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
  background-color: #7FAD39;
  border: none;
  border-radius: 15px;
}
  button.stylinggg:hover {background-color: #3e8e41}
  button.stylinggg:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);

}
    input.styling {
         background-color: #7FAD39;
  border: none;
  color: white;
  padding: 7px 12px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
    }



</style> 
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    
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
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
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
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <div style="color: red; font-size: 30px;">${mess}</div>
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart.items}" var="item">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="./resources/image/<c:out value="${item.image}" />" width="70"? alt="">
                                        <h5>${item.tenSanPham}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                            <fmt:formatNumber value="${item.gia}" pattern="#,###" /> </td>
                                   
                                    <td class="shoping__cart__quantity">
                                    <form action="ShoppingCartServlet">
                                                    <input type="hidden" name="action" value="updateCart">
                                                     <input type="hidden" name="maHang" value="${item.maHang}"><br>
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                
<!--                                                <input type="hidden" name="pricePro" value="${c.pricePro}"/>-->
                                                <input type="number" name="quantity"min = 0 value="${item.quantity}"/>

                                            </div>

                                        </div>
                                        <input class="styling" type="submit" name="submitupdate" value="Update"/>
                                        </form>
                                    </td>

                                    <td class="shoping__cart__total">
                                      <fmt:formatNumber value="${item.gia*item.quantity}" pattern="#,###" /> VNĐ
                                    </td>
                                    <c:set value="${cart.totalPrice}" var="p" />
                                    <c:set value="<%=   request.getAttribute("saleOff") %>" var="s"/>
                                    <td class="shoping__cart__item__close">
                                        <!-- <span class="icon_close"></span> -->
                                        <form action="ShoppingCartServlet" method="get">
                                    <input type="hidden" name="action" value="Remove">
                                    <input type="hidden" name="maHang" value="${item.maHang}"><br>
                                    <input type="submit" value="X">
                            </form>
                                    </td>
                                </tr>
                               </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                
                <div class="col-lg-6">
                     <div class="shoping__cart__btns">
                        <a href="." class="primary-btn cart-btn">Quay lại</a>
                        
                    </div>
                </div>
                <div class="col-lg-6">
                    <form action="" method="post">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Tổng tiền <span> <fmt:formatNumber value="${p}" pattern="#,###" />  VNĐ</span></li>
                           
                                 
                            
                           

                        </ul>
                        
                        <a href="checkout" class="primary-btn">Thanh toán</a>
                        
                        
                      
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
<%@include file="component-ui/footer.jsp" %>
