<%-- 
    Document   : listadmin
    Created on : Oct 7, 2023, 8:13:02 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
<%@ page import="Model.CustomerModel" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm Khách hàng </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id= "CustomerForm" action="add-Customer" method="POST">
                <input type="hidden" name="idCustomer" id="idCustomer" >

                <div class="modal-body">
                    <input type="hidden" name="delete_id" value="">
                    <div class="form-group">
                        <label> Tên Người Dùng </label>
                        <input id="fullName" type="text" name="fullName" required class="form-control" placeholder="Enter Username">
                    </div>            
                    <div class="form-group">
                        <label>Email</label>
                        <input id="email" type="text" name="email" class="form-control" placeholder="Enter Email"> 
                        <div class="alert-danger" id="alert-danger" role="alert">

                        </div>         
                        <div class="alert-success" id="alert-success" role="alert">

                        </div>
                    </div>

                    <div class="form-group">
                        <label>Mật khẩu </label>
                        <input id="password" type="text" name="password" class="form-control" placeholder="Enter Password">
                    </div>             
                    <div class="form-group">
                        <label> Địa Chỉ</label>
                        <input id="address" type="text" name="address" class="form-control" value="" placeholder="Enter Address">
                    </div>
                    <div class="form-group">
                        <label> Số điện thoại </label>
                        <input id="numberPhone" type="text" name="numberPhone" class="form-control" value="" placeholder="Enter Number Phone">
                        <div class="alert-danger" id="alert-danger1" role="alert">

                        </div>
                        <div class="alert-success" id="alert-success1" role="alert">

                        </div>
                    </div>        
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="registerbtn" class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Khách Hàng
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
                    Thêm Khách Hàng
                </button>
            </h6>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th>Email </th>
                            <th>FullName</th>
                            <th>Address</th>
                            <th>NumberPhone </th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCustomer}" var="cus">
                            <tr>
                                <td>${cus.idCustomer}</td>
                                <td>${cus.email}</td>
                                <td>${cus.fullName}</td>
                                <td>${cus.address}</td>
                                <td>${cus.numberPhone}</td>
                                <td>
                                    <form action="update-Customer" method="post">
                                        <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                                        <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                                        <!--<a href="editCustomer.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                                    </form>
                                </td>
                                <td>
                                    <form action="delete-Customer" method="post">
                                        <input type="hidden" name="idCustomer" value="${cus.idCustomer}">
                                        <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <!--          <tr>
                                  
                                    
                                  </tr>-->

                    </tbody>
                </table>

            </div>
        </div>
    </div>

</div>
<script>
    function isValidEmail(email) {
        // Biểu thức chính quy để kiểm tra định dạng email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Sử dụng test() để kiểm tra xem email có khớp với biểu thức chính quy hay không
        return emailRegex.test(email);
    }
    const emailtxt = document.getElementById("email");

    emailtxt.addEventListener('input', function () {
//            alert(emailtxt.value);
        const note = document.getElementById("alert-danger");
        const note1 = document.getElementById("alert-success");
        if (emailtxt.value === "") {
            note.style.display = 'none';
            note1.style.display = 'none';
        } else if (isValidEmail(emailtxt.value)) {
            note1.innerHTML = 'Email hợp lệ';
            note.style.display = 'none';
            note1.style.display = 'block';
        } else {
            note.innerHTML = 'Email không hợp lệ';
            note1.style.display = 'none';
            note.style.display = 'block';
        }
    });

    function isValidPhoneNumber(phoneNumber) {
        // Biểu thức chính quy kiểm tra số điện thoại
        var phoneRegex = /^\d{10,12}$/;

        // Sử dụng test() để kiểm tra xem số điện thoại có khớp với biểu thức chính quy hay không
        return phoneRegex.test(phoneNumber);
    }
    const phonetxt = document.getElementById("numberPhone");
    phonetxt.addEventListener('input', function () {
//            alert(emailtxt.value);
        const note = document.getElementById("alert-danger1");
        const note1 = document.getElementById("alert-success1");
        if (phonetxt.value === "") {
            note.style.display = 'none';
            note1.style.display = 'none';
        } else if (isValidPhoneNumber(phonetxt.value)) {
            note1.innerHTML = 'Số điện thoại hợp lệ';
            note.style.display = 'none';
            note1.style.display = 'block';
        } else {
            note.innerHTML = 'Số điện thoại không hợp lệ';
            note1.style.display = 'none';
            note.style.display = 'block';
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        var table = document.getElementById('dataTable');

        const existingContent = new Set();
        let defaultAction = 'add-Customer';

        var clickButtonEdit = false;



        //Cập nhật
        document.addEventListener('click', function (e) {
            if (e.target && e.target.id === 'edit_btn') {

                let form = document.getElementById('CustomerForm');
                form.action = 'update-Customer';
                clickButtonEdit = true;

                let row = e.target.closest('tr');

                document.getElementById("idCustomer").value = row.cells[0].innerText;
                document.getElementById("email").value = row.cells[1].innerText;
                document.getElementById("fullName").value = row.cells[2].innerText;
                document.getElementById("address").value = row.cells[3].innerText;
                document.getElementById("numberPhone").value = row.cells[4].innerText;
                var idCustomer = document.getElementById("idCustomer").value;
                $.ajax({
                    url: "/J2EE_Project_Admin/loadPasswordCus", // Đường dẫn tương đối hoặc đầy đủ đến tài nguyên xử lý đăng nhập
                    type: "post", // Phương thức HTTP là POST để bảo mật thông tin đăng nhập
                    data: {
                        idCustomer: idCustomer
                    }, // Sử dụng serialize để lấy dữ liệu từ form
                    success: function (data) {
                        try {
                            // Xử lý phản hồi từ server
                            if (data.pass !== "") {
                                document.getElementById("password").value = data.pass;
                            } else {
                                // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
                                alert("không thành công");
                            }
                        } catch (error) {
                            console.error("Lỗi phân tích JSON:", error);
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu có
                    }
                });
                existingContent.clear();
            } else if (e.target && e.target.id === 'exit-btn') {
                let form = document.getElementById('CustomerForm');
                form.action = defaultAction;
            }
        });
        document.addEventListener('click', function (e) {
            // Kiểm tra xem phần tử được click có thuộc modal không
            let isModalClick = isDescendant(document.getElementById('addadminprofile'), e.target);
            if ((isModalClick === false && clickButtonEdit === false)) {
                let form = document.getElementById('CustomerForm');
                // Khôi phục giá trị mặc định của action khi click ra ngoài modal
                form.action = defaultAction;
            }

            clickButtonEdit = false;

        });

    });

    function isDescendant(parent, child) {
        let node = child.parentNode;

        while (node !== null) {
            if (node === parent) {
                return true;
            }
            node = node.parentNode;
        }

        return false;
    }
//check email đã đăng ký chưa 
    $("#CustomerForm").submit(function (event) {
        // Lấy giá trị của action từ form
        const formAction = $(this).attr('action');
        // Kiểm tra xem action có phải là "add-Staff" không
        if (formAction === "add-Customer") {
            event.preventDefault();
            const note = document.getElementById("alert-danger");
            const note1 = document.getElementById("alert-success");
            $.ajax({
                url: "/J2EE_Project_Admin/checkAccountCus", // Đường dẫn tương đối hoặc đầy đủ đến tài nguyên xử lý đăng nhập
                type: "post", // Phương thức HTTP là POST để bảo mật thông tin đăng nhập
                data: $("#CustomerForm").serialize(), // Sử dụng serialize để lấy dữ liệu từ form
                success: function (data) {
                    try {

                        // Xử lý phản hồi từ server
                        if (data.result === "1") {
                            // Nếu đăng nhập thành công, thực hiện chuyển hướng hoặc các hành động khác
                            note1.style.display = 'none';
                            note.style.display = 'block';
                            note.innerHTML = "Email đã được đăng ký";
                        } else {
                            // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
                            $.ajax({
                                url: "/J2EE_Project_Admin/add-Customer", // Đường dẫn tương đối hoặc đầy đủ đến tài nguyên xử lý đăng nhập
                                type: "post", // Phương thức HTTP là POST để bảo mật thông tin đăng nhập
                                data: $("#CustomerForm").serialize(), // Sử dụng serialize để lấy dữ liệu từ form
                                success: function (data) {
                                    window.location.href = "/J2EE_Project_Admin/Customer";
                                },
                                error: function (xhr) {
                                }

                            });
                        }
                    } catch (error) {
                        console.error("Lỗi phân tích JSON:", error);
                    }
                },
                error: function (xhr) {
                    // Xử lý lỗi nếu có
                }
            });
        }
    });

</script>

<%@include file="component/footer.jsp" %>

