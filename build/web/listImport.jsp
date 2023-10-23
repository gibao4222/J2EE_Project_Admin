
<%-- 
    Document   : listImport
    Created on : Oct 7, 2023, 7:46:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Nhân Viên </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="" method="POST">

        <div class="modal-body">
            <input type="hidden" name="delete_id" value="">
            <div class="form-group">
                <label> Tên Người Dùng </label>
                <input type="text" name="username" class="form-control" placeholder="Enter Username">
            </div>
             <div class="form-group">
                <label>Tên Admin</label>
                <input type="name" name="name" class="form-control" placeholder="Enter name">
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email">
            </div>
            <div class="form-group">
                <label>Mật Khẩu</label>
                <input type="password" name="password" class="form-control" placeholder="Enter Password">
            </div>
            <div class="form-group">
                <label>Xác Nhận Mật Khẩu</label>
                <input type="password" name="confirmpassword" class="form-control" placeholder="Confirm Password">
            </div>
            <div class="form-group">
              <label >Chức Vụ</label>
                <select name="level" class="form-control">
                  <option value= "0">Admin</option>
                  <option value= "1">Nhân viên</option>
                </select>
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
    
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Hóa Đơn Nhập Hàng
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Hóa Đơn
            </button>
    </h6>
<div class="card-body">
  <form action="" method="post">
  

    <div class="table-responsive">
<table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th> Ngày Đặt </th>
            <th width="15%">Nhà Sản xuất </th>
            <th>Tổng Tiền</th>
            <th>Địa Chỉ</th>
            <th>Thao tác</th>

          </tr>
        </thead>
        <tbody>
          <tr>
             
            <td value="idbill" name="idbill" data-name="<?= $result['order_Id'] ?>" ><a href="billdetails.php?idbill=<?php echo $result['order_Id']?>"> IM001</a></td>
            <td>May 20, 2023, 9:03 pm</td>
            <td>Nghệ thuật lừa đảo</td>
            <td>$100</td>
            <td>Hóc Môn</td>
            <td>
                <form action="" method="post">
                    <input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">
                    <button  type="submit" name="edit_btn" class="btn btn-success"> Cập nhật </button>
                  <input type="hidden" name="delete_id" value="<?php echo $result['admin_User']; ?>">
                  <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa</button>
                </form>
            </td>

          </tr>
    
        </tbody>
      </table>  
        
    </div>
  </form>
  
    </div>
    </div>




<script>
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
  
  
</script>