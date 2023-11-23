<%-- 
    Document   : login
    Created on : Sep 28, 2023, 9:34:31 PM
    Author     : Admin
--%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
        

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
        
            <form id="register" action="register" method="post" class="sign-in-form">
                                                  <mark>${message}</mark>
<div class="alert-danger" id="alert-danger" role="alert">
              ${mess}  
            </div>
            <h2 class="title">Sign up</h2>
             <div class="input-field">
          <i class="fa-solid fa-font"></i>
              <input type="text" name="fullname" value="" placeholder="fullname" />
            </div>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="email" value="" id="email" placeholder="Email" />
            </div>
            <style>
                .alert-danger{
                    color: #FF6347;
                }
            </style>
            <div class="alert-danger" id="alert-danger" role="alert">
                
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" value="" placeholder="Password" />
            </div>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="address" value="" placeholder="addresss" />
            </div>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="phone" value="" placeholder="phone" />
            </div>
           
            <input type="submit" value="register" class="btn solid" />
            <p style="color:red;" ></p>
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
            <a href="register.jsp" class="btn transparent" id="sign-up-btn">
              Sign up
            </a>
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

    <!--<script src="./resources/js/login.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function isValidEmail(email) {
            // Biểu thức chính quy để kiểm tra định dạng email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            // Sử dụng test() để kiểm tra xem email có khớp với biểu thức chính quy hay không
            return emailRegex.test(email);
        }
        const emailtxt = document.getElementById("email");
        
        emailtxt.addEventListener('input',function (){
//            alert(emailtxt.value);
            const note = document.getElementById("alert-danger");
                    if (isValidEmail(emailtxt.value)) {
                        note.innerHTML ='Email hợp lệ';
                    } else {
                        note.innerHTML ='Email không hợp lệ';
                    }
        });
        
//        $("#register").submit(function (event) {
//            // Ngăn chặn hành động mặc định của form
//            event.preventDefault();
//            const note = document.getElementById("alert-danger");
//            $.ajax({
//                url: "",  // Đường dẫn tương đối hoặc đầy đủ đến tài nguyên xử lý đăng nhập
//                type: "post",  // Phương thức HTTP là POST để bảo mật thông tin đăng nhập
//                data: $("#register").serialize(),  // Sử dụng serialize để lấy dữ liệu từ form
//                success: function (data) {
//                     try {
//
//                // Xử lý phản hồi từ server
//                    if (data.status === "success") {
//                        // Nếu đăng nhập thành công, thực hiện chuyển hướng hoặc các hành động khác
//                        window.location.href = "/J2EE_Project_Admin-main/home";
//                    } else {
//                        // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
//                        note.innerHTML="Email hoặc password không đúng";
//                    }
//                    } catch (error) {
//            console.error("Lỗi phân tích JSON:", error);
//        }
//                },
//                error: function (xhr) {
//                    // Xử lý lỗi nếu có
//                }
//            });
//        });
    </script>
</html>
