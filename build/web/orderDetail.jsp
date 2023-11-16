<%-- 
    Document   : listadmin
    Created on : Oct 7, 2023, 8:13:02 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>


<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Chi Tiết Đơn Hàng </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id= "OrderDetailForm" action="add-OrderDetail" method="POST">
            <input type="hidden" name="idOrderDetail" id="idOrderDetail" >

        <div class="modal-body">
            <input type="hidden" name="delete_id" value="">
            <div class="form-group">
                <label> ID ORDER </label>
                <input id="idOrder" type="text" name="idOrder" required class="form-control" placeholder="Enter ID">
            </div>            
            <div class="form-group">
                <label>ID Product</label>
                <input id="idProduct" type="text" name="idProduct" class="form-control" placeholder="Enter ID">
            </div>
            <div class="form-group">
                <label> Ngày tạo</label>
                <input id="dateCreated" type="date" name="dateCreated" class="form-control" placeholder="Enter Date" value="">
            </div>
            <div class="form-group">
                <label> Quantity </label>
                <input id="quantity" type="text" name="quantity" class="form-control" value="" placeholder="Enter Quantity">
            </div>
            <div class="form-group">
                <label> Price </label>
                <input id="price" type="text" name="price" class="form-control" value="" placeholder="Enter Price">
            </div>
            <div class="form-group">
                <label> Total </label>
                <input id="total" type="text" name="total" class="form-control" value="" placeholder="Enter Total">
            </div>
            <div class="form-group">
                <label>ID SALE</label>
                <input id="idSale" type="text" name="idSale" class="form-control" value="" placeholder="Enter ID">

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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Đơn Hàng Chi Tiết
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Đơn Hàng Chi Tiết
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
             <th> ID </th>
            <th>ID ORDER </th>
            <th>ID Product</th>
            <th>Date CREATED</th>
            <th>Quantity </th>
            <th>Price </th>
            <th>Total</th>
            <th>IdSale</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
             <c:forEach items="${listOrderDetail}" var="odd">
                <tr>
                    <td>${odd.idOrderDetail}</td>
                    <td>${odd.idOrder}</td>
                    <td>${odd.idProduct}</td>
                    <td>${odd.dateCreated}</td>
                    <td>${odd.quantity}</td>
                    <td>${odd.price}</td>
                    <td>${odd.total}</td>
                    <td>${odd.idSale}</td>
                    <td>
                        <form action="" method="post">
                            <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                            <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                              <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                        </form>
                     </td>
                      <td>
                        <form action="delete-OrderDetail" method="post">
                       
                          <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                             <input type="hidden" name="idOrderDetail" value="${odd.idOrderDetail}">
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

    // Cập nhật
    document.addEventListener('click', function(e) {
        if (e.target && e.target.id === 'edit_btn') {
            let form = document.getElementById('OrderDetailForm');
            form.action = 'update-OrderDetail';

            let row = e.target.closest('tr');

            document.getElementById("idOrderDetail").value = row.cells[0].innerText;
            document.getElementById("idOrder").value = row.cells[1].innerText;
            document.getElementById("idProduct").value = row.cells[2].innerText;
            document.getElementById("dateCreated").value = formatDate(row.cells[3].innerText);
            document.getElementById("quantity").value = row.cells[4].innerText;
            document.getElementById("price").value = row.cells[5].innerText;
            document.getElementById("total").value = row.cells[6].innerText;
            document.getElementById("idSale").value = row.cells[7].innerText;
            existingContent.clear();
        }
    });

    // Chuyển đổi ngày khi mở modal
    $('#addadminprofile').on('show.bs.modal', function() {
        document.getElementById("dateCreated").value = formatDate(new Date());
    });
});

function formatDate(inputDate) {
    var date = new Date(inputDate);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return `${year}-${month}-${day}`;
}

</script>
<%@include file ="component/footer.jsp" %>