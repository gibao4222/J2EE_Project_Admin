<%-- 
    Document   : login
    Created on : Sep 28, 2023, 9:34:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./resources/css/styleLogin.css">
        <script 
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
            <form th:action="@{/signin}" method="POST" class="sign-in-form">
            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="username" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" placeholder="Password" />
            </div>
            <input type="submit" value="Login" class="btn solid" />
            <p style="color:red;" th:text="${errorLogin}"></p>
            <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
            <form th:action="@{/register}"  method="POST" class="sign-up-form">
                <h2 class="title">Sign up</h2>

                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" name="Fullname" placeholder="Username" />
                </div>

                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="Password" placeholder="Password" />
                </div>

                <div class="input-field">
                    <i class="fa fa-address-book"></i>
                    <input type="text" name="Address" placeholder="Address" />
                </div>

                <div class="input-field">
                    <i class="fas fa-city"></i>
                    <input type="text" name="City" placeholder="City" />
                </div>

                <input type="submit" class="btn" value="Sign up" />
                <p class="social-text">Or Sign up with social platforms</p>
                <div class="social-media">
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
              ex ratione. Aliquid!
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="./resources/img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
              laboriosam ad deleniti.
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="./resources/img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="./resources/js/login.js"></script>
    <form action="Login">
            Nhập tên thuê bao:<input type="text" name="txtThuebao" vaule=""><br/>
            Nhập số điện thoại:<input type="text" name="txtSDT" vaule=""><br/>
            Địa chỉ:<input type="text" name="txtDiaChi" vaule=""><br/>
            <input type="submit" name="submit" value="Tra cuu">

            
        </form>
    </body>
</html>hgh
