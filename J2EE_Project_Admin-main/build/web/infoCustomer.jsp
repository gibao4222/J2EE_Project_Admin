<%-- 
    Document   : infoCustomer
    Created on : Nov 27, 2023, 1:29:58 PM
    Author     : Thanhchan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component-ui/header.jsp" %>

    <style>
       
.container-inf {
    text-align: center;
}
        .error-message {
            color: red;
        }
        form#customerForm {
    text-align: center;
    margin-left: 380px;
}
    </style>



<div class="container-inf">
    <h2>Thông Tin Khách Hàng</h2>
    <form style="width: 500px;" id="customerForm">
        <div class="form-group">
            <label for="name">Họ và Tên:</label>
            <input type="text" class="form-control" id="name" name="name" value="${name}">
        </div>
       
       <input type="hidden" class="form-control" id="email" name="email" value="${email}">

        <div class="form-group">
            <label for="phone">Địa chỉ:</label>
            <input type="tel" class="form-control" id="address" name="address" value="${address}">
        </div>
        <div class="form-group">
            <label for="phone">Số Điện Thoại:</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${phone}">
        </div>
        
        <div id="error-message" class="error-message"></div>
        <div id="success-message" class="alert alert-success" style="display:none;"></div>
        <button type="button" class="btn btn-success" onclick="updateInfo()">Cập Nhật Thông Tin</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    function validateEmail(email) {
        // Biểu thức chính quy để kiểm tra địa chỉ email
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(email);
    }

    function updateInfo() {
        // Lấy giá trị từ các trường input
        var name = $("#name").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var address = $("#address").val();

        // Kiểm tra điều kiện
        if (name.trim() === '' || phone.trim() === ''||address.trim()==='') {
            $("#error-message").text('Vui lòng điền đầy đủ thông tin.').show();
            return;
        } else {
            $("#error-message").text('').hide();
        }

        // Kiểm tra email
        if (!validateEmail(email)) {
            $("#error-message").text('Vui lòng nhập một địa chỉ email hợp lệ.').show();
            return;
        } else {
            $("#error-message").text('').hide();
        }

        // Gửi dữ liệu đến servlet sử dụng AJAX
        $.ajax({
            type: "POST",
            url: "updateInfo",  // Thay đổi thành URL thực tế của servlet
            data: { name: name, email: email, phone: phone,address: address },
            success: function(response) {
                // Xử lý phản hồi từ servlet
                $("#success-message").text(response).show();
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    }
</script>

<%@include file="component-ui/footer.jsp" %>


