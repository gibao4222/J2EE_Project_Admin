<%-- 
    Document   : listSupplier
    Created on : Oct 10, 2023, 8:56:08 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Thương Hiệu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form id= "SupplierForm" action="add-Supplier" method="POST">
        <input type="hidden" name="idSupplier" id="idSupplier" >
        <div class="modal-body">

            <div class="form-group">

                <label> Tên Nhà Sản Xuất </label>

                <input type="text" id="SupplierNameAdd" name="SupplierNameAdd" class="form-control" placeholder="Enter Supplier">
                <div class="alert-danger" id="alert-danger1" role="alert">
                
            </div>
            </div>
            
            <div class="form-group">

                <label> Địa Chỉ </label>

                <input type="text"id="addressSupplierAdd" name="addressSupplierAdd" class="form-control" placeholder="Enter Address">
                <div class="alert-danger" id="alert-danger1" role="alert">
                
            </div>
            </div>
            <script>
                function validatePhoneNumber(input) {
                // Loại bỏ mọi ký tự không phải số từ giá trị nhập vào
                input.value = input.value.replace(/\D/g, '');
            }
            </script>
            <div class="form-group">

                <label> SĐT </label>

                <input type="text" id="PhoneSupplierAdd" name="PhoneSupplierAdd" class="form-control" placeholder="Enter Number Phone" oninput="validatePhoneNumber(this)" value="">
                <div class="alert-danger" id="alert-danger1" role="alert">
                
                </div>
                <div class="alert-success" id="alert-success1" role="alert">
                
                </div>
            </div>
            
        
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" name="addbrand" class="btn btn-primary">Lưu</button>
        </div>
      </form>

    </div>
  </div>
</div>



 
<!-- /.container-fluid -->






<div class="container-fluid">
<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách NSX 
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile" id="add-btn">
             Thêm NSX
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

     <!--<form action="Supplier" method="POST">-->
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th> Tên NSX </th>
            <th> Địa Chỉ </th>
            <th> SĐT </th>
            <th>Chỉnh Sửa </th>
            <th>Xóa Thương Hiệu </th>
          </tr>
        </thead>
        <tbody>
             <c:forEach items="${listSupplier}" var="sup">
                <tr>
                    <td>${sup.idSupplier}</td>
                    <td>${sup.nameSuppiler}</td>                    
                    <td>${sup.address}</td>
                    <td>${sup.numberPhone}</td>
                    <td>
                        <form action="update-Supplier" method="post">
                            <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                            <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                              <!--<a href="editCustomer.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                        </form>
                     </td>
                      <td>
                        <form action="delete-Supplier" method="post">
                          <input type="hidden" name="idSupplier" value="${sup.idSupplier}">
                          <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                        </form>
                      </td>
                </tr>
            </c:forEach>
<!--          <tr>
          
            
          </tr>-->
        </tbody>
      </table>
       <!--</form>-->

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
                        
                        let form = document.getElementById('SupplierForm');
                        form.action='update-Supplier';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idSupplier").value = row.cells[0].innerText;                        
                        document.getElementById("SupplierNameAdd").value = row.cells[1].innerText;
                        document.getElementById("addressSupplierAdd").value = row.cells[2].innerText;
                        document.getElementById("PhoneSupplierAdd").value = row.cells[3].innerText;

                        existingContent.clear();
                                                
                    }
                    else if(e.target && e.target.id === 'add-btn'){
                        document.getElementById("idSupplier").value ="";
                        document.getElementById("SupplierNameAdd").value ="";
                        document.getElementById("addressSupplierAdd").value = "";
                        document.getElementById("PhoneSupplierAdd").value ="";
                    }
                });
                

            });
            
            function isValidPhoneNumber(phoneNumber) {
                // Biểu thức chính quy kiểm tra số điện thoại
                var phoneRegex = /((09|03|07|08|05)+([0-9]{8})\b)/g;

                // Sử dụng test() để kiểm tra xem số điện thoại có khớp với biểu thức chính quy hay không
                return phoneRegex.test(phoneNumber);
            }
            const phonetxt = document.getElementById("PhoneSupplierAdd");
            
            phonetxt.addEventListener('input',function (){
                const inputArr = document.querySelectorAll("#SupplierForm .form-group .alert-danger");
                console.log(inputArr.length);
                const note_danger = inputArr[2];
                const note_success = document.getElementById("alert-success1");
                if(phonetxt.value===""){
                        note_danger.style.display ='none';
                        note_success.style.display ='none';
                    }
                    else if (isValidPhoneNumber(phonetxt.value)) {
                        note_success.innerHTML ='Số điện thoại hợp lệ';
                        note_danger.style.display ='none';
                        note_success.style.display ='block';
                    } else {
                        note_danger.innerHTML ='Số điện thoại không hợp lệ';
                        note_success.style.display ='none';
                        note_danger.style.display ='block';
                    }

            });
            
            
</script>
<%@include file="component/footer.jsp" %>