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
     
        <form action="add-Promotion" id="promotionForm" method="POST">

        <div class="modal-body">
            <input type="hidden" name="idPromo" id="idPromo" value="">
            <div class="form-group">

                <label style="margin-left: 15px"> Mã Giảm Giá </label>
                <input type="text" style="width: 90%;margin: auto" name="code" id="code" class="form-control" placeholder="Enter Coupon code">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Tên Chương Trình Khuyến Mãi </label>
                <input type="text" style="width: 90%;margin: auto" name="namePromo" id="namePromo" class="form-control" placeholder="Enter Name Promotion">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Ngày Bắt Đầu </label>
                <input type="text" style="width: 90%;margin: auto" name="dateStart" id="dateStart" class="form-control" placeholder="Enter Date Start">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Ngày Kết Thúc </label>
                <input type="text" style="width: 90%;margin: auto" name="dateEnd" id="dateEnd" class="form-control" placeholder="Enter Date End">

            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Chiết Khấu </label>
                <input type="text" style="width: 90%;margin: auto" name="saleOff" id="saleOff" class="form-control"  placeholder="Enter Discount">
                
            </div>
            
            <div class="form-group">

                <label style="margin-left: 15px"> Giảm Tối Đa </label>
                <input type="text" style="width: 90%;margin: auto" name="reduceMax" id="reduceMax" class="form-control" placeholder="Enter Reduce Max">

            </div>
            
            <div class="form-group">
                <label style="margin-left: 15px"> Danh Sách Sản Phẩm </label>
                <div class="container-fluid" style="display: flex; justify-content: space-between; gap: 10px;">
                    <div class="card shadow mb-4"style="min-width: 650px;">
                        <div class="card-body" >
                            <div class="table-responsive table-Cover">
                                
                                <table class="table table-bordered table-ScrollBar" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox"></th>
                                            <th>Mã Sản Phẩm</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Ảnh</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${dataProduct}" var="c">
                                        <tr data-productid="${c.idProduct}">
                                            <td><input type="checkbox"></td>

                                                        <td>${c.idProduct}</td>
                                            <td>${c.nameProduct}</td>
                                            <td><img src="./resources/img/${c.image}" style="width: 120px; height: 100px" ></td>

                                            
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

     <form action="promotion" method="POST">
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
            <c:forEach items="${dataPromotion}" var="c">
          <tr>
            <td> ${c.idPromo}</td>
            <td> ${c.code}</td>
             <td> ${c.namePromo}</td>
            <td> ${c.dateStart} -> ${c.dateEnd}</td>
            <td> ${c.saleOff}%<input id="rowReduceMax" value="${c.reduceMax}" type="hidden"></td>

            <td>
                <form action="delete-Promotion" method="post">
                    <input type="hidden" name="idPromo" id="idPromo" value="${c.idPromo}">
                  <button  type="submit" name="delete_btn" class="btn btn-danger">Xóa</button>
                </form>
                <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">ê đít</button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
       </form>

    </div>
  </div>
</div>

</div>
<script>
    //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('promotionForm');
                        form.action='update-Promotion';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idPromo").value = row.cells[0].innerText;
                        document.getElementById("namePromo").value = row.cells[2].innerText;
                        document.getElementById("code").value = row.cells[1].innerText;
                        let time = row.cells[3].innerText.split('->');
                        document.getElementById("dateStart").value = time[0];
                        document.getElementById("dateEnd").value = time[1];
                        document.getElementById("saleOff").value = row.cells[4].innerText.slice(0,-1);
                        let permissionCell = row.cells[4];
                        let permissionInput = permissionCell.querySelector('input');
                        let str = permissionInput ? permissionInput.value : '';
                        document.getElementById("reduceMax").value = str;
                    }});
</script>

<!-- /.container-fluid -->

