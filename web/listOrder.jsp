<%-- 
    Document   : listOrder
    Created on : Oct 7, 2023, 7:22:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <!--        <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        
                      </div>
                     
                      <form action="" method="POST">
                
                        <div class="modal-body">
                
                            <div class="form-group">
                
                                <label> Trạng thái </label>
                                <input type="hidden" name="test" id="test"  value="">
                                 <input type="text" name="brandName" class="form-control" placeholder="Enter Brand"> 
                                <select class="form-control"  id="status" name="status">
                                    
                                  
                                        <option  selected value="0">Đang Xử Lý</option>
                                        <option value="1">Đang Giao Hàng</option>
                                        <option value="2">Thành Công</option>
                                        <option value="3">Xóa Đơn</option>
                                   
                                  </select>
                                
                            </div>
                            
                        
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" name="submit" class="btn btn-primary">Lưu</button>
                        </div>-->
                <h5 class="modal-title" id="exampleModalLabel">Thêm Đơn hàng </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id= "OrderForm" name="idOrder" action="add-Order" method="POST">
                <input type="hidden" name="idOrder" id="idOrder" >

                <div class="modal-body">
                    <input type="hidden" name="delete_id" value="">
                    <div class="form-group">
                        <label> IDCustomer </label>
                        <input id="idCustomer" type="text" name="idCustomer" required class="form-control" placeholder="Enter IDCustomer">
                    </div>            
                    <div class="form-group">
                        <label>Ngày đặt</label>
                        <input id="dateCreated" type="date" name="dateCreated"  class="form-control" placeholder="Enter Date">
                    </div>
                    <div class="form-group">
                        <label> TotalBill</label>
                        <input id="totalBill" type="text" name="totalBill" class="form-control" value="" placeholder="Enter TotalBill">
                    </div>
                    <div class="form-group">
                        <label> Trạng thái </label>
                        <input id="status" type="text" name="status" class="form-control" value="" placeholder="Enter status">
                    </div>
                   

                    </div>
              
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="registerbtn"  class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Đơn Hàng
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Đơn Hàng
            </button>
            </h6>

        </div>

        <div class="card-body">
            <!--  <form action="" method="post">-->


            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th width="15%">Khách Hàng </th>
                            <th> Ngày Đặt </th>

                            <th>Tổng Tiền</th>

                            <th width="15%">Trạng Thái </th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${data}" var="order">
                            <tr>
                                <td>${order.idOrder}</td>
                                <td>${order.idCustomer}</td>
                                <td>${order.dateCreated}</td>
                                <td>${order.totalBill}</td>
                                <td>${order.status}</td>
                                <td>
                                    <form action="" method="post">
                                        <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                                        <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
                                        <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                                    </form>
                                </td>
                                <td>
                                    <form action="delete-Order" method="post">
                                       
                                        <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                                         <input type="hidden" name="idOrder" value="${order.idOrder}">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>






                        <!--            <td>-->



                        <!--                  <input  id="edit" type="button" name="submit" class="btn btn-primary" value="Cập nhật trạng thái" data-toggle="modal" data-target="#addadminprofile">-->

                        <!--               
                                    </td>-->
                        <!--          </tr>-->

                    </tbody>
                </table>  

            </div>
            <!--  </form>-->
        </div>
    </div>

</div>

<!--<script>
  $(document).ready(function(){
    
    $("#dataTable").on('click','#edit',function(){
      
      var currentRow = $(this).closest("tr");
      var id=currentRow.find("td:eq(0)").text();
      // var status=currentRow.find("td:eq(5)").val(); 
      
      // var show = id;
      // alert(show);
      $("#test").val(id);
      // $("#statuss").val(matp);
    });
 });
  
  
</script>-->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var table = document.getElementById('dataTable');

        const existingContent = new Set();




        //Cập nhật
        document.addEventListener('click', function (e) {
            if (e.target && e.target.id === 'edit_btn') {

                let form = document.getElementById('OrderForm');
                form.action = 'update-Order';


                let row = e.target.closest('tr');

                document.getElementById("idOrder").value = row.cells[0].innerText;
                document.getElementById("idCustomer").value = row.cells[1].innerText;
                document.getElementById("dateCreated").value = row.cells[2].innerText;
                document.getElementById("totalBill").value = row.cells[3].innerText;
                document.getElementById("status").value = row.cells[4].innerText;
                existingContent.clear();

            }
        });

    });

</script>
<%@include file ="component/footer.jsp" %>