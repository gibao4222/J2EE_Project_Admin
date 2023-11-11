<%-- 
    Document   : listCustomer
    Created on : Oct 9, 2023, 9:36:39 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
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
            </div>            
            <div class="form-group">
                <label> Địa Chỉ</label>
                <input id="address" type="text" name="address" class="form-control" value="" placeholder="Enter Address">
            </div>
            <div class="form-group">
                <label> Số điện thoại </label>
                <input id="numberPhone" type="text" name="numberPhone" class="form-control" value="" placeholder="Enter Number Phone">
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
                 document.addEventListener('DOMContentLoaded', function() {
                var table = document.getElementById('dataTable');
            
                const existingContent = new Set();
                
               
              
                
                //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('CustomerForm');
                        form.action='update-Customer';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idCustomer").value = row.cells[0].innerText;
                        document.getElementById("email").value = row.cells[1].innerText;
                        document.getElementById("fullName").value = row.cells[2].innerText;
                        document.getElementById("address").value = row.cells[3].innerText;
                        document.getElementById("numberPhone").value = row.cells[4].innerText;

                        existingContent.clear();
                                                
                    }
                });

            });
</script>
<%@include file="component/footer.jsp" %>