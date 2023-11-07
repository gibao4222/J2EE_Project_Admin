<%-- 
    Document   : listCustomer
    Created on : Oct 9, 2023, 9:36:39 PM
    Author     : Admin
--%>

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
        <h5 class="modal-title" id="exampleModalLabel">Thêm Khách Hàng </h5>
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
                <label> Địa Chỉ</label>
                <input type="text" name="address" class="form-control" value="" placeholder="Enter Address">
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
              Thêm Khách hàng 
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
            <th>Password</th>
            <th>Full Name</th>
            <th>Reset Password </th>
            <th>DELETE </th>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td> <?php echo $i; ?> </td>
            <td> <?php echo $result['admin_Email']; ?></td>
            <td> *** </td>
            <td> <?php echo $result['level']; ?></td>
            <td>
                <form action="" method="post">
                    <input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">
                    <button  type="submit" name="edit_btn" class="btn btn-success"> RESET Mật Khẩu </button>
                      <a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a> 
                </form>
            </td>
            <td>
                <form action="" method="post">
                  <input type="hidden" name="delete_id" value="<?php echo $result['admin_User']; ?>">
                  <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa Nhân Viên</button>
                </form>
            </td>
          </tr>
        </tbody>
      </table>

    </div>
  </div>
</div>

</div>
