<%-- 
    Document   : listSupplier
    Created on : Oct 10, 2023, 8:56:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                
            </div>
            
            <div class="form-group">

                <label> Địa Chỉ </label>

                <input type="text"id="addressSupplierAdd" name="addressSupplierAdd" class="form-control" placeholder="Enter Address">
                
            </div>
            
            <div class="form-group">

                <label> SĐT </label>

                <input type="text" id="PhoneSupplierAdd" name="PhoneSupplierAdd" class="form-control" placeholder="Enter Number Phone">
                
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
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
                });

            });
</script>