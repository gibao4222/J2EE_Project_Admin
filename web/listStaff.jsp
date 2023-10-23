<%-- 
    Document   : listadmin
    Created on : Oct 7, 2023, 8:13:02 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/styleComponent.css">
        <link rel="stylesheet" href="./resources/css/styleLogin.css">
        <link rel="stylesheet" href="./resources/css/sb-admin-2.css">
        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style>
        <script src="chrome-extension://ajdpfmkffanmkhejnopjppegokpogffp/assets/prompt.js"></script>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Nhân Viên </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id= "StaffForm" action="add-Staff" method="POST">
            <input type="hidden" name="idStaff" id="idStaff" >

        <div class="modal-body">
            <input type="hidden" name="delete_id" value="">
            <div class="form-group">
                <label> Tên Người Dùng </label>
                <input id="fullName" type="text" name="fullName" required class="form-control" placeholder="Enter Username">
            </div>            
            <div class="form-group">
                <label>Email</label>
                <input id="email" type="text" name="email" class="form-control" placeholder="Enter Email">
            </div>
            <div class="form-group">
                <label> Địa Chỉ</label>
                <input id="address" type="text" name="address" class="form-control" value="" placeholder="Enter Address">
            </div>
            <div class="form-group">
                <label> Số điện thoại </label>
                <input id="numberPhone" type="text" name="numberPhone" class="form-control" value="" placeholder="Enter Number Phone">
            </div>
            <div class="form-group">
                <label> Tài Khoản Ngân Hàng </label>
                <input id="bankAccount" type="text" name="bankAccount" class="form-control" value="" placeholder="Enter Bank Account">
            </div>
            <div class="form-group">
                <label> Số Tài Khoản </label>
                <input id="accountNumber" type="text" name="accountNumber" class="form-control" value="" placeholder="Enter Account Number">
            </div>
            <div class="form-group">
                <label>Nhóm quyền</label>
                <input id="idGroup" type="text" name="idGroup" class="form-control" value="" placeholder="Enter Account Number">

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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Admin
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Admin
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
            <th>BankAccount </th>
            <th>AccountNumber</th>
            <th>IdGroup</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
             <c:forEach items="${listStaff}" var="staff">
                <tr>
                    <td>${staff.idStaff}</td>
                    <td>${staff.email}</td>
                    <td>${staff.fullName}</td>
                    <td>${staff.address}</td>
                    <td>${staff.numberPhone}</td>
                    <td>${staff.bankAccount}</td>
                    <td>${staff.accountNumber}</td>
                    <td>${staff.idGroup}</td>
                    <td>
                        <form action="" method="post">
                            <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                            <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                              <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                        </form>
                     </td>
                      <td>
                        <form action="delete-Staff" method="post">
                          <input type="hidden" name="idStaff" value="${staff.idStaff}">
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
                 document.addEventListener('DOMContentLoaded', function() {
                var table = document.getElementById('dataTable');
            
                const existingContent = new Set();
                
               
              
                
                //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('StaffForm');
                        form.action='update-Staff';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idStaff").value = row.cells[0].innerText;
                        document.getElementById("email").value = row.cells[1].innerText;
                        document.getElementById("fullName").value = row.cells[2].innerText;
                        document.getElementById("address").value = row.cells[3].innerText;
                        document.getElementById("numberPhone").value = row.cells[4].innerText;
                        document.getElementById("bankAccount").value = row.cells[5].innerText;
                        document.getElementById("accountNumber").value = row.cells[6].innerText;
                        document.getElementById("idGroup").value = row.cells[7].innerText;
                        existingContent.clear();
                                                
                    }
                });

            });
</script>