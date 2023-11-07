<%-- 
    Document   : listOrder
    Created on : Oct 7, 2023, 7:22:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form action="" method="POST">

        <div class="modal-body">

            <div class="form-group">

                <label> Trạng thái </label>
                <input type="hidden" name="test" id="test"  value="">
                <!-- <input type="text" name="brandName" class="form-control" placeholder="Enter Brand"> -->
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
            
    </h6>
    
  </div>

  <div class="card-body">
  <form action="" method="post">
  

    <div class="table-responsive">
<table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th> Ngày Đặt </th>
            <th width="15%">Khách Hàng </th>
            <th>Tổng Tiền</th>
            <th>Địa Chỉ</th>
            <th width="15%">Trạng Thái </th>
            <th>Thao Tác</th>
          </tr>
        </thead>
        <tbody>
          <tr>
             
            <td value="idbill" name="idbill" data-name="<?= $result['order_Id'] ?>" ><a href="billdetails.php?idbill=<?php echo $result['order_Id']?>"> OD001</a></td>
            <td>May 20, 2023, 9:03 pm</td>
            <td>Võ Trần Gia Bảo</td>
            <td>$100</td>
            <td>Hóc Môn</td>
            
            <td class="text-danger">Đang Xử Lý</td>
       
                    
               
          
            <td>
                
      
               
                  <input  id="edit" type="button" name="submit" class="btn btn-primary" value="Cập nhật trạng thái" data-toggle="modal" data-target="#addadminprofile">
                 
               
            </td>
          </tr>
    
        </tbody>
      </table>  
        
    </div>
  </form>
  </div>
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