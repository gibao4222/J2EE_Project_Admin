<%-- 
    Document   : confirm
    Created on : Nov 6, 2023, 2:36:39 PM
    Author     : Thanhchan
--%>
<%@include file="component-ui/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <style>
    /* CSS để tạo bố cục và kiểu dáng */
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
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
<%@include file="component-ui/footer.jsp" %>
