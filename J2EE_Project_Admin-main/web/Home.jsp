<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="component-ui/header.jsp" %>
<section class="hero">
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
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Tìm kiếm theo chất liệu</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                 <label for="white">
                                     <a href="stuff?id=wood
" style="color:black" >  Wood
</a>
                                    <input type="radio" id="white">
                                </label>
                            </div>      
                        
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                   <a href="stuff?id=aluminum" style="color:black" >  Aluminum</a>
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    <a href="stuff?id=metal" style="color:black" >  Metal</a>
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                   <a href="stuff?id=rubber" style="color:black" >  Rubber</a>
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                   <a href="stuff?id=plastic" style="color:black" >  High quality plastic</a>
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            
                            <form action="Search" method="POST">
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
                    <div class="hero__item set-bg" data-setbg="https://theme.hstatic.net/200000417685/1001040197/14/slide_3_img.jpg?v=650">
<!--                          <img src="http://webcoban.vn/image/flower.gif">-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm nổi bật</h2>
                    </div>
                    
                </div>
            </div>
            <div class="row featured__filter">
                 <c:forEach items="${data}" var="c">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="./resources/image/<c:out value="${c.image}"/>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="details?idproduct=<c:out value="${c.idProduct}"/>"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${c.nameProduct}</a></h6>
                             <h6><a href="#">Còn lại:${c.quantity}</a></h6>
                            <h5><fmt:formatNumber value="${c.price}" pattern="#,###" />
                    VNĐ</h5>
                        </div>
                    </div>
                </div>
               </c:forEach>
                
            </div>
        </div>
    </section>
    
   
<%@include file="component-ui/footer.jsp" %>