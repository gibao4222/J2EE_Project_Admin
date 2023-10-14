<%-- 
    Document   : promotion
    Created on : Oct 14, 2023, 10:33:40 AM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./resources/css/styleComponent.css">
<link rel="stylesheet" href="./resources/css/sb-admin-2.css">
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

    <div class="modal-dialog" style="min-width: 750px" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Mã Giảm Giá</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form action="" method="POST">

        <div class="modal-body">
            
            <div class="form-group">

                <label style="margin-left: 15px"> Mã Giảm Giá </label>
                <input type="text" style="width: 90%;margin: auto" name="code" class="form-control" placeholder="Enter Coupon code">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Tên Chương Trình Khuyến Mãi </label>
                <input type="text" style="width: 90%;margin: auto" name="namePromo" class="form-control" placeholder="Enter Name Promotion">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Ngày Bắt Đầu </label>
                <input type="text" style="width: 90%;margin: auto" name="dateStart" class="form-control" placeholder="Enter Date Start">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Ngày Kết Thúc </label>
                <input type="text" style="width: 90%;margin: auto" name="dateEnd" class="form-control" placeholder="Enter Date End">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Chiết Khấu </label>
                <input type="text" style="width: 90%;margin: auto" name="saleOff" class="form-control"  placeholder="Enter Discount">
                
            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Giảm Tối Đa </label>
                <input type="text" style="width: 90%;margin: auto" name="reduceMax" class="form-control" placeholder="Enter Reduce Max">

            </div>
            
            <div class="form-group">
                <div class="container-fluid" style="display: flex; justify-content: space-between; gap: 10px;">
                    <div class="card shadow mb-4"style="min-width: 650px;">
                        <div class="card-body" >
                            <div class="table-responsive table-Cover">
                                <table class="table table-bordered table-ScrollBar" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox"></th>
                                            <th>Danh Sách Quyền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${dataPermission}" var="c">
                                        <tr data-permissionid="${c.idPermission}">
                                            <td><input type="checkbox"></td>
                                            <td> ${c.idPermission} | ${c.namePermission} | ${c.portray}</td>
                                            
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                   
                </div>
                
                
                
            </div>
            
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" name="registerbtn" class="btn btn-primary">Lưu</button>
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Khuyến Mãi 
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Chương Trình
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

     <form action="" method="POST">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th> Mã Giảm Giá</th>
            <th> Tên Chương Trình Khuyến Mãi</th>
            <th> Thời Gian</th>
            <th> Chiết Khấu</th>
            <th> Thao Tác </th>
            
          </tr>
        </thead>
        <tbody>
          
          <tr>
            <td> <?php echo $i; ?> </td>
            <td> <?php echo $result['code']; ?></td>
             <td> <?php echo $result['discount']; ?>%</td>
            <td> <?php echo $result['discount']; ?>%</td>
            <td> <?php echo $result['discount']; ?>%</td>
            <td>
                <form action="" method="post">
                  <input type="hidden" name="delete_id" value="<?php echo $result['id_discount']?>">
                  <button  type="submit" name="delete_btn" class="btn btn-danger">Xóa</button>
                </form>
            </td>
          </tr>

        </tbody>
      </table>
       </form>

    </div>
  </div>
</div>

</div>


<!-- /.container-fluid -->

