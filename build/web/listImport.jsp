
<%-- 
    Document   : listImport
    Created on : Oct 7, 2023, 7:46:17 PM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>


<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nhập hàng </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id= "ImportForm" action="add-Import" method="POST">
            <input type="hidden" name="idImport" id="idImport" >

        <div class="modal-body">
            <input type="hidden" name="delete_id" value="">
            <div class="form-group">
                <label> ID Supplier </label>
                <input id="idSupplier" type="text" name="idSupplier" required class="form-control" placeholder="Enter ID">
            </div>            
            <div class="form-group">
                <label>Date Created</label>
                <input id="dateCreated" type="text" name="dateCreated" class="form-control" placeholder="Enter Date">
            </div>
            <div class="form-group">
                <label> Total Bill</label>
                <input id="totalBill" type="text" name="totalBill" class="form-control" value="" placeholder="Enter Total">
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Nhập Hàng
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Nhập Hàng
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
             <th> ID </th>
            <th>ID SUPPLIER </th>
            <th>Date Created</th>
            <th>Total Bill</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
             <c:forEach items="${dataImport}" var="ip">
                <tr>
                    <td>${ip.idImport}</td>
                    <td>${ip.idSupplier}</td>
                    <td>${ip.dateCreated}</td>
                    <td>${ip.totalBill}</td>
                    <td>
                        <form action="" method="post">
                            <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                            <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                              <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                        </form>
                     </td>
                      <td>
                        <form action="delete-Import" method="post">
                          <input type="hidden" name="idImport" value="${ip.idImport}">
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
                        
                        let form = document.getElementById('ImportForm');
                        form.action='update-Import';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idImport").value = row.cells[0].innerText;
                        document.getElementById("idSupplier").value = row.cells[1].innerText;
                        document.getElementById("dateCreated").value = row.cells[2].innerText;
                        document.getElementById("totalBill").value = row.cells[3].innerText;
                   
                        existingContent.clear();
                                                
                    }
                });

            });
</script>
<%@include file ="component/footer.jsp" %>