<%-- 
    Document   : homepage.jsp
    Created on : Oct 27, 2023, 7:30:14 AM
    Author     : Thanhchan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web bán thức ăn </title>
    <link rel="stylesheet" href="./resources/css/style1.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>


    <div id="wrapper">
        <div id="header">
            <a href="" class="logo">
                <img src="./resources/image/logo.png" alt="">
            </a>
            <div id="menu">
                <div class="item">
                    <a href="">Trang chủ</a>
                </div>
                <div class="item">
                   <div class="dropdown">
<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">sản phẩm
<span class="caret"></span></button>
<ul class="dropdown-menu">
    <c:forEach items="${datacate}" var="v">
<li><a tabindex="-1" href="category?id_category=<c:out value="${v.idCategory}"/>">${v.nameCategory}</a></li>
 </c:forEach>


</ul>
</li>
</ul>
</li>
</ul>
</div>
                </div>
                <div class="item">
                    <a href="">Blog</a>
                </div>
                <div class="item">
                    <a href="">Liên hệ</a>
                </div>
            </div>
            <div id="actions">
                <div class="item">
                    <img src="./resources/image/user.png" alt="">
                </div>
                <div class="item">
                    <img src="./resources/image/cart.png" alt="">
                </div>
            </div>
        </div>
        <div id="banner">
            <div class="box-left">
                <h2>
                    <span>THỨC ĂN</span>
                    <br>
                    <span>THƯỢNG HẠNG</span>
                </h2>
                <p>Chuyên cung cấp các món ăn đảm bảo dinh dưỡng
                    hợp vệ sinh đến người dùng,phục vụ người dùng 1 cái
                    hoàn hảo nhất</p>
                <button>Mua ngay</button>
            </div>
            <div class="box-right">
                <img src="./resources/image/img_1.png" alt="">
                <img src="./resources/image/img_2.png" alt="">
                <img src="./resources/image/img_3.png" alt="">
            </div>
            <div class="to-bottom">
                <a href="">
                    <img src="./resources/image/to_bottom.png" alt="">
                </a>
            </div>
        </div>
        <div id="wp-products">
            <h2>SẢN PHẨM CỦA CHÚNG TÔI</h2>
            <ul id="list-products">
                
                <c:forEach items="${data}" var="c">
                <div class="item">
                    <img id="img-sp" src="./resources/image/<c:out value="${c.image}"/>">
                    <div class="stars">
                        <span>
                            <img src="./resources/image/star.png" alt="">
                        </span>
                        <span>
                            <img src="./resources/image/star.png" alt="">
                        </span>
                        <span>
                            <img src="./resources/image/star.png" alt="">
                        </span>
                        <span>
                            <img src="./resources/image/star.png" alt="">
                        </span>
                        <span>
                            <img src="./resources/image/star.png" alt="">
                        </span>
                    </div>

                    <div class="name">${c.nameProduct}</div>
                    <div class="desc">${c.introduce}</div>
                     <div class="name">Còn lại:${c.quantity}</div>
                    <div class="price">${c.price}</div>

                </div>
 </c:forEach>

              
            </ul>
            <div class="list-page">
                <div class="item">
                    <a href="">1</a>
                </div>
                <div class="item">
                    <a href="">2</a>
                </div>
                <div class="item">
                    <a href="">3</a>
                </div>
                <div class="item">
                    <a href="">4</a>
                </div>
            </div>
        </div>

        <div id="saleoff">
            <div class="box-left">
                <h1>
                    <span>GIẢM GIÁ LÊN ĐẾN</span>
                    <span>45%</span>
                </h1>
            </div>
            <div class="box-right"></div>
        </div>

        <div id="comment">
            <h2>NHẬN XÉT CỦA KHÁCH HÀNG</h2>
            <div id="comment-body">
                <div class="prev">
                    <a href="#">
                        <img src="./resources/image/prev.png" alt="">
                    </a>
                </div>
                <ul id="list-comment">
                    <li class="item">
                        <div class="avatar">
                            <img src="./resources/image/avatar_1.png" alt="">

                        </div>
                        <div class="stars">
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                        </div>
                        <div class="name">Nguyễn Đình Vũ</div>

                        <div class="text">
                            <p>Lorem Ipsum is simply dummy text of the printing and
                                typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type
                                specimen book.</p>
                        </div>
                    </li>
                    <li class="item">
                        <div class="avatar">
                            <img src="./resources/image/avatar_1.png" alt="">

                        </div>
                        <div class="stars">
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                        </div>
                        <div class="name">Trần Ngọc Sơn</div>

                        <div class="text">
                            <p>Lorem Ipsum is simply dummy text of the printing and
                                typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type
                                specimen book.</p>
                        </div>
                    </li>
                    <li class="item">
                        <div class="avatar">
                            <img src="./resources/image/avatar_1.png" alt="">

                        </div>
                        <div class="stars">
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                            <span>
                                <img src="./resources/image/star.png" alt="">
                            </span>
                        </div>
                        <div class="name">Nguyễn Trần Vi</div>

                        <div class="text">
                            <p>Lorem Ipsum is simply dummy text of the printing and
                                typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type
                                specimen book.</p>
                        </div>
                    </li>
                </ul>
                <div class="next">
                    <a href="#">
                        <img src="./resources/image/next.png" alt="">
                    </a>
                </div>
            </div>
        </div>

        <div id="footer">
            <div class="box">
                <div class="logo">
                    <img src="./resources/image/logo.png" alt="">
                </div>
                <p>Cung cấp sản phẩm với chất lượng an toàn cho quý khách</p>
            </div>
            <div class="box">
                <h3>NỘI DUNG</h3>
                <ul class="quick-menu">
                    <div class="item">
                        <a href="">Trang chủ</a>
                    </div>
                    <div class="item">
                        <a href="">Sản phẩm</a>
                    </div>
                    <div class="item">
                        <a href="">Blog</a>
                    </div>
                    <div class="item">
                        <a href="">Liên hệ</a>
                    </div>
                </ul>
            </div>
            <div class="box">
                <h3>LIÊN HỆ</h3>
                <form action="">
                    <input type="text" placeholder="Địa chỉ email">
                    <button>Nhận tin</button>
                </form>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>

</html>
