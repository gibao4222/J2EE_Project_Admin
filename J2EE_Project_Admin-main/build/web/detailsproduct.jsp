<%-- 
    Document   : detailsproduct
    Created on : Oct 30, 2023, 9:32:03 PM
    Author     : Thanhchan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component-ui/header.jsp" %>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container1 {
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
.product {
    margin-bottom: -100px;
}
        .product-image img {
    width: 150px;
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
 <section class="breadcrumb-section set-bg" data-setbg="./resources/img2/background.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Chi tiết sản phẩm</h2>
                        <div class="breadcrumb__option">
                            <a href="home">Trang chủ</a>
                            <span>Thông tin mua hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container1">
       
       <form action="ShoppingCartServlet" method="GET">
         <div class="product">
            <div class="product-image">
                <img src="./resources/image/<%=   request.getAttribute("img") %>" alt="Product Image">
            </div>
            <div class="product-info">
                <h2 class="product-title">Tên sản phẩm: <%=   request.getAttribute("nameproduct") %> </h2>
                <p class="product-price">Giá sản phẩm:<fmt:formatNumber value="<%=   request.getAttribute("price") %>" pattern="#,###" /> VNĐ </p>
                
                <p class="product-quantity">Số lượng:1 <input name="quantity" type="hidden" min="1" value="1" /></p>
               
            </div>
        </div>
        <div class="product-gallery">
            <c:forEach items="${sub}" var="c">
                <img class="sub-galerry" src="./resources/image/<c:out value="${c.subImage}"/>" alt="Product Image 1">
            
            </c:forEach>
            <!-- Thêm các hình ảnh phụ khác -->
        </div>
                <input type="hidden" name="action" value="AddCart">
                                <input type="hidden" name="price" value="<%=   request.getAttribute("price") %>" />    
                                <input type="hidden" name="image" value="<%=   request.getAttribute("img") %>" />    

                <input type="hidden" name="nameproduct" value="<%=   request.getAttribute("nameproduct") %>" />    
           <input type="hidden" name="action" value="add" />
            <input type="hidden" name="idProduct" value="<%=   request.getAttribute("IdProduct") %>"/>
                <input  type="submit" class="buy-button" value="Mua hàng" />
         </form>
    </div>
<%@include file="component-ui/footer.jsp" %>

