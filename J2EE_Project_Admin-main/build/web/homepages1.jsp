<%-- 
    Document   : homepages1
    Created on : Nov 7, 2023, 2:40:29 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>sungla</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="./resources/css1/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="./resources/css1/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="./resources/css1/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="./resources/./resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="./resources/css1/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <style>
    /* Thanh tìm kiếm */
    #productFilter {
        margin-bottom: 20px;
    }

    #searchInput {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 200px;
    }

    #filterOption {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-left: 10px;
    }

    /* Danh sách sản phẩm */
    #productList {
        display: flex;
        flex-wrap: wrap;
    }

    .product {
        background-color: #f4f4f4;
        border-radius: 4px;
        padding: 10px;
        margin: 10px;
        width: 200px;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
button.btn.btn-primary {
    margin-left: 15px;
}
    /* Màu sắc sản phẩm */
    .red {
        color: red;
    }
.mt-4 {
            margin-top: 1rem;
        }
    .blue {
        color: blue;
    }

    .green {
        color: green;
    }
    div#productFilter {
    text-align: center;
}

    /* Thêm các lớp màu sắc khác tại đây */
</style>
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="./resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="index.html"><img src="./resources/images/logo.png" alt="#" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item active">
                                 <a class="nav-link" href="index.html">Home</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="about.html">About</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="glasses.html">Our Glasses</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="shop.html">Shop</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="contact.html">Contact Us</a>
                              </li>
                              <li class="nav-item d_none login_btn">
                                  <c:choose>
                    <c:when test="${empty sessionScope.name}">
                        <a href="login.jsp">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a href="logout">Logout</a>
                    </c:otherwise>
                </c:choose>
                              </li>
                             
                              <li class="nav-item d_none sea_icon">
                                 <a class="nav-link" href="#"><i class="fa fa-shopping-bag" aria-hidden="true"></i><i class="fa fa-search" aria-hidden="true"></i></a>
                              </li>
                           </ul>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- end header inner -->
      <!-- end header -->
      <!-- banner -->
      <section class="banner_main">
         <div id="banner1" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner1" data-slide-to="0" class="active"></li>
               <li data-target="#banner1" data-slide-to="1"></li>
               <li data-target="#banner1" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="./resources/./resources/images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="#">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="./resources/./resources/images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="#">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="./resources/images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="#">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      <!-- end banner -->
      <!-- about section -->
      <div class="about">
         <div class="container">
            <div class="row d_flex">
               <div class="col-md-5">
                  <div class="about_img">
                     <figure><img src="./resources/images/about_img.png" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-7">
                  <div class="titlepage">
                     <h2>About Our Shop</h2>
                     <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                  </div>
                  <a class="read_more" href="#">Read More</a>
               </div>
            </div>
         </div>
      </div>
      <!-- about section -->
      <!-- Our  Glasses section -->
      <div class="glasses">
         <div class="container">
            <div class="row">
               <div class="col-md-10 offset-md-1">
                  <div class="titlepage">
                     <h2>Our Glasses</h2>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor
                        e et dolore magna aliqua. Ut enim ad minim veniam, qui
                     </p>
                  </div>
               </div>
            </div>
         </div>
          <%
        String id = (String) session.getAttribute("idCustomer");
    %>

    <%-- Hiển thị dữ liệu --%>
    <p>Welcome, <%= id %>!</p>
           <div class="container mt-4">
        <h2>lọc sản phẩm</h2>
        
        <form style="text-align: center;    margin-bottom: 20px;" action="FilterServlet" method="POST">
            <div class="form-group">
                <label for="filterOption">Lọc theo:</label>
                <select class="form-control" id="filterOption" name="filterOption" onchange="showHideFields()">
                    <option value="low_to_high">Giá thấp - cao</option>
                    <option value="high_to_low">Giá cao - thấp</option>
                    <option value="less_than_a">Bé hơn a</option>
                    <option value="greater_than_a">Lớn hơn a</option>
                    <option value="range_a_b">Từ a đến b</option>
                </select>
            </div>
            
            <div class="form-group" id="rangeAField" style="display: none;">
                <label for="rangeA">a:</label>
                <input type="text" class="form-control" id="rangeA" name="rangeA">
            </div>
            
            <div class="form-group" id="rangeBField" style="display: none;">
                <label for="rangeB">b:</label>
                <input type="text" class="form-control" id="rangeB" name="rangeB">
            </div>
            
            <button type="submit" class="btn btn-primary">Lọc</button>
        </form>
    </div>
           <div id="productFilter">
        <form action="searchProductServlet" method="POST">
        <div class="input-group">
            <input type="text" id="searchInput" name="searchValue" class="form-control" placeholder="Tìm kiếm...">
            <select id="filterOption" name="filterOption" class="form-control">
                <option value="name">Tìm kiếm theo tên</option>
                <option value="color">Tìm kiếm theo màu sắc</option>
            </select>
            <div class="input-group-append">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            </div>
        </div>
    </form> 
    </div>
          
         <div class="container-fluid">
             
            <div class="row">
                                <c:forEach items="${data}" var="c">
                                    <a  href="details?idproduct=<c:out value="${c.idProduct}"/>">         
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                  <div class="glasses_box">
                     <figure><img style="height: 300px;width: 250px;" src="./resources/image/<c:out value="${c.image}"/>"</figure>
                     <h3><fmt:formatNumber value="${c.price}" pattern="#,###" />
                    VNĐ</h3>
                     <h2>color: ${c.color}</h2>
                     <div class="name">Quantity:${c.quantity}</div>
                     <p>${c.nameProduct}</p>
                  </div>
               </div>
                  </a>    
               </c:forEach>

               <div class="col-md-12">
                  <a class="read_more" href="#">Read More</a>
               </div>
            </div>
         </div>
      </div>
      <!-- end Our  Glasses section -->
      <!-- Our shop section -->
      <div id="about" class="shop">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-5">
                  <div  class="shop_img">
                     <figure><img src="./resources/images/shop_img.png" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-7 padding_right0">
                  <div class="max_width">
                     <div class="titlepage">
                        <h2>Best SunGlasses  At Our shop</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                        <a class="read_more" href="#">Shop Now</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end Our shop section -->
      <!-- clients section -->
      <div class="clients">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>What say our clients</h2>
                     <p>orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut la</p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div id="myCarousel" class="carousel slide clients_Carousel " data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="container">
                              <div class="carousel-caption ">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="clients_box">
                                          <figure><img src="./resources/images/our.png" alt="#"/></figure>
                                          <h3>Sandy Mark</h3>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact  a more-or-less normal distribution of letters,</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="clients_box">
                                          <figure><img src="./resources/images/our.png" alt="#"/></figure>
                                          <h3>Sandy Mark</h3>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact  a more-or-less normal distribution of letters,</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="clients_box">
                                          <figure><img src="./resources/images/our.png" alt="#"/></figure>
                                          <h3>Sandy Mark</h3>
                                          <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact  a more-or-less normal distribution of letters,</p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                     <i class='fa fa-angle-left'></i>
                     </a>
                     <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                     <i class='fa fa-angle-right'></i>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end clients section -->
      <!-- contact section -->
      <div id="contact" class="contact">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <form id="request" class="main_form">
                     <div class="row">
                        <div class="col-md-12 ">
                           <h3>Contact Us</h3>
                        </div>
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Name" type="type" name="Name"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Phone Number" type="type" name="Phone Number"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Email" type="type" name="Email">                          
                        </div>
                        <div class="col-md-12">
                           <input class="contactusmess" placeholder="Message" type="type" Message="Name">
                        </div>
                        <div class="col-md-12">
                           <button class="send_btn">Send</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <div class="container-fluid">
            <div class="map_section">
               <div id="map">
               </div>
            </div>
         </div>
      </div>
      </div>
      <!-- end contact section -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-8 offset-md-2">
                     <ul class="location_icon">
                        <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a><br> Location</li>
                        <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a><br> +01 1234567890</li>
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a><br> demo@gmail.com</li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="./resources/js/jquery.min.js"></script>
      <script src="./resources/js/popper.min.js"></script>
      <script src="./resources/js/bootstrap.bundle.min.js"></script>
      <script src="./resources/js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="./resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="./resources/js/custom.js"></script>
      <script>
         // This example adds a marker to indicate the position of Bondi Beach in Sydney,
         // Australia.
         function initMap() {
           var map = new google.maps.Map(document.getElementById('map'), {
             zoom: 11,
             center: {lat: 40.645037, lng: -73.880224},
             });
         
         var image = './resources/images/maps-and-flags.png';
         var beachMarker = new google.maps.Marker({
             position: {lat: 40.645037, lng: -73.880224},
             map: map,
             icon: image
           });
         }
         function showHideFields() {
            var filterOption = document.getElementById("filterOption").value;
            var rangeAField = document.getElementById("rangeAField");
            var rangeBField = document.getElementById("rangeBField");
            
            if (filterOption === "less_than_a" || filterOption === "greater_than_a") {
                rangeAField.style.display = "block";
                rangeBField.style.display = "none";
            } else if (filterOption === "range_a_b") {
                rangeAField.style.display = "block";
                rangeBField.style.display = "block";
            } else {
                rangeAField.style.display = "none";
                rangeBField.style.display = "none";
            }
        }
      </script>
      <!-- google map js -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
      <!-- end google map js --> 
   </body>
</html>


