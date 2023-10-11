<%-- 
    Document   : listSupplier
    Created on : Oct 10, 2023, 8:56:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Thương Hiệu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form action="" method="POST">

        <div class="modal-body">

            <div class="form-group">

                <label> Tên Nhà Sản Xuất </label>

                <input type="text" name="SupplierNameAdd" class="form-control" placeholder="Enter Supplier">
                
            </div>
            
            <div class="form-group">

                <label> Địa Chỉ </label>

                <input type="text" name="addressSupplierAdd" class="form-control" placeholder="Enter Address">
                
            </div>
            
            <div class="form-group">

                <label> SĐT </label>

                <input type="text" name="PhoneSupplierAdd" class="form-control" placeholder="Enter Number Phone">
                
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

     <form action="" method="POST">
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

          <tr>
            <td>  </td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td>
                <form action="" method="post ">
                    <input type="hidden" name="edit_id" value="<?php echo $result['brandId']?>">
                    <a href="editbrand.php?brandid=<?php echo $result['brandId']?>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Chỉnh Sửa</a>
                  
                </form>
            </td>
            <td>
                <form action="" method="post">
                  <input type="hidden" name="delete_id" value="<?php echo $result['brandId']?>">
                  <button  type="submit" name="delete_btn" class="btn btn-danger">Xóa</button>
                </form>
            </td>
          </tr>
        <?php
          }
            }
            ?>  
        </tbody>
      </table>
       </form>

    </div>
  </div>
</div>

</div>
<script>
  $(document).ready(function(){
    
    $("#dataTable").on('click','#edit_btn',function(){
      var currentRow = $(this).closest("tr");
      var id=currentRow.find("td:eq(0)").text();
      $("#test").val(id);
      
    });
 });
  
  
</script>
