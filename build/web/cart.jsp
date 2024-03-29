<%-- 
    Document   : cart
    Created on : Oct 18, 2023, 1:59:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/styleComponent.css">
<link rel="stylesheet" href="./resources/css/sb-admin-2.css">
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="./resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css">
<link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
    <section class="breadcrumb-section set-bg" data-setbg="img/background.jpg">
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
                                    <th>Size</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $a=0;
                                $sub_total = 0; 
                                $sl = 0;
                                $get_cat = $ct->get_Cart();
                                if($get_cat){
                                    
                                    while ($result = $get_cat->fetch_assoc()) {
                                            
                           
                            ?>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="admin/uploads/<?php echo $result['image']?>" width="70"? alt="">
                                        <h5><?php echo $result['productName']?> </h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <?php echo '$'.$fm->format_currency($result['price'])?> 
                                    </td>
                                    <td class="shoping__cart__price">
                                         <?php echo $result['size']?> 
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <form action="" method="post">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="hidden" name="cartId"min = 0 value="<?php echo $result['cartId']?>"/>
                                                <input type="number" name="quantity"min = 0 value="<?php echo $result['quantity']?>"/>

                                            </div>

                                        </div>
                                        <input class="styling" type="submit" name="submitupdate" value="Update"/>
                                        </form>
                                    </td>

                                    <td class="shoping__cart__total">
                                        <?php $total= $result['price'] * $result['quantity'];                               
                                    echo '$'.$fm->format_currency($total);
                                    $sl +=$result['quantity'];
                                    ?>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <!-- <span class="icon_close"></span> -->
                                        <td><a onclick ="return confirm('Bạn có muốn xóa?')" href="?delid=<?php echo $result['cartId']?>">X</a></td>
                                    </td>
                                </tr>
                            <?php 
                            $sub_total += $total;
                            }

                                    }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="index.php" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="" method="post">
                                <input type="text" name="codediscount" placeholder="Enter your coupon code">
                                <button type="submit" name="discount" class="site-btn">APPLY COUPON</button>
                                <!-- <button type="submit" name="undiscount" class="site-btn">APPLY COUPON</button> -->
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <form action="" method="post">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span><?php  
                                    
                                    echo '$'.$fm->format_currency($sub_total);
                                    
                                ?></span></li>
                            <?php 
                                    $discount = $ct->get_Discount($code);
                                    if($discount){
                                    
                                        while ($result = $discount->fetch_assoc()) {
                                            
                           
                                ?>    
                                 
                            <li>Discount (<?php echo $result['code']?>) 

                                <span><?php echo $result['discount']."%"?>(<?php 
                                        $a =($result['discount']*$sub_total)/100;
                                        echo '$'.$fm->format_currency($a);

                                  ?>)</span>
                                <?php 
                                    if($result['code']!=""){


                                 ?>
                                <button type="submit" name="undiscount" class="stylinggg">remove</button>
                                <?php 
                                } ?>
                            </li>

                            <li>Total <span><?php  
                                    
                                     $alltotal= ($sub_total - $a);
                                     echo '$'.$fm->format_currency($alltotal);
                                    Session::set('qtt',$sl);
                                    Session::set('total',$alltotal);
                                ?></td></span></li>
                                <?php 
                            
                            }

                                    }else{
                                     ?>
                                         
                                    <li>Total <span><?php  
                                    
                                    $alltotal= ($sub_total - $a);
                                    echo '$'.$fm->format_currency($alltotal);
                                    Session::set('qtt',$sl);
                                    Session::set('total',$alltotal);
                                ?></td></span></li>
                                   <?php  
                                   }
                                   ?> 
                           

                        </ul>
                        <?php 
                            $qtt=Session::get("qtt");
                            if($qtt!='0'){
                         ?>
                        <a href="checkout.php" class="primary-btn">PROCEED TO CHECKOUT</a>
                        <?php 
                        }else{

                         ?>
                           <a href="index.php" class="primary-btn">PROCEED TO CHECKOUT</a>
                           <?php 
                              }
                                                ?>
                      
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
