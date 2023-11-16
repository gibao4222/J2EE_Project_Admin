<%-- 
    Document   : listProduct
    Created on : Oct 10, 2023, 9:27:36 AM
    Author     : Admin
--%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
  .scroll{
  height: 700px;
  overflow: scroll;
}
</style>

<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<?php 
if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['registerbtn'])){

       

        $insertProd = $prod->insert_product($_POST,$_FILES);
    }
       ?>
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Sản Phẩm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
        <form action="add-product" id="Productform">

        <div class="modal-body">
            <input type="hidden" name="IdProduct" id="IdProduct">
            <div class="form-group">

                <label> Name Product </label>
                <input type="text" name="nameProduct" id="nameProduct1" class="form-control" placeholder="Enter Product">
            </div>
             <div class="form-group">

                 <div class="form-group">

                <label>category </label>
                <select name="id_category" id="id_category">
                    <c:forEach items="${cate}" var="v">
                        <option value="${v.idCategory }">${v.nameCategory}</option>
                     </c:forEach>
                </select>
            </div>
            </div>
             <div class="form-group">

                <label> introduce </label>
                <input type="text" name="introduce" id="introduce1" class="form-control" placeholder="Enter introduce">
            </div>
             <div class="form-group">

                <label> Ảnh </label>
                <input type="file" name="image" id="image1" class="form-control" >
            </div>
                 <div class="form-group">

                <label> size </label>
                <input type="text" name="size" id="size1" class="form-control" placeholder="Enter size">
            </div>
             <div class="form-group">

                <label> color </label>
                <input type="text" name="corlor" id="size1" class="form-control" placeholder="Enter color">
            </div>
            
            <label> stuff </label>
            <input type="text" name="stuff" id="stuff1" class="form-control" placeholder="Enter stuff">
          
            <div class="form-group">

                <label> Quantity </label>
                <input type="text" name="quantity" id="quantity1" class="form-control" placeholder="Enter quantity">
            </div>
                <div class="form-group">

                <label> Price </label>
                <input type="text" name="price" id="price1" class="form-control" placeholder="Enter price">
            </div>
            
            <div class="form-group">

                <label> portray </label>
                <input type="text" name="portray" id="portray1" class="form-control" placeholder="Enter portray">
            </div>
    </div>
           
<!--             <div class="form-group">

                <label> Image Thumbnail </label>
                <input type="file" name="thumb1" class="form-control" >
                <input type="file" name="thumb2" class="form-control" >
                <input type="file" name="thumb3" class="form-control" >
                <input type="file" name="thumb4" class="form-control" >
            </div> -->
            
        
        
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Sản Phẩm 
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
             Thêm Sản Phẩm
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

     <form action="" method="POST">
      <div class="scroll">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th>nameProduct</th>  
            <th>category</th>
                    <th>introduce</th>
                    <th>image</th>
                    <th>size</th>
                    <th>color</th>
                    <th>stuff</th>
                    <th>quantity</th>
                    <th>portray</th>
                    <th>price</th>
                    <th >Action</th>
          </tr>
        </thead>
        <tbody>

          <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.id} </td>
                   
                    <td>  ${c.nameProduct} </td>
                     <td>  ${c.id_category} </td>
                     <td>  ${c.introduce} </td>
                     <td>  ${c.image} </td>
                    
                     <td>   ${c.size}  </td>
                     <td> ${c.color}  </td>
                     <td>  ${c.stuff}  </td>
                     <td>   ${c.quantity}  </td>
                     <td>   ${c.portray}  </td>
                     <td>   ${c.price}  </td>
                    </form>
                     <td >  <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button> <a href="delete-product?id=<c:out value="${c.id}"/>">delete</a></td>
                    
                </tr>
                   </c:forEach>
                
        </tbody>
      </table>
      </div>
       

    </div>
  </div>
</div>

</div>

<script>
     //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('Productform');
                        form.action='save-product';
                        
                        
                        let row = e.target.closest('tr');
                        document.getElementById("IdProduct").value = row.cells[0].innerText;

                        document.getElementById("nameProduct1").value = row.cells[1].innerText;
                        document.getElementById("introduce1").value = row.cells[2].innerText;
//                        document.getElementById("image1"). = row.cells[3].innerText; 
                        document.getElementById("size1").value = row.cells[5].innerText;
                          document.getElementById("color").value = row.cells[6].innerText;
                        document.getElementById("stuff1").value = row.cells[6].innerText;
                        document.getElementById("quantity1").value = row.cells[7].innerText;
                        document.getElementById("price1").value = row.cells[9].innerText;
                        document.getElementById("portray1").value = row.cells[8].innerText;
//                        document.getElementById("nameGroup").value = row.cells[1].innerText;
//                        document.getElementById("portray").value = row.cells[2].innerText;
                        
//                        existingContent.clear();
//                        list.forEach(function(id){
//                            //Tìm dòng trong bảng table có mã tương tự
//                            let sourceRow = table.querySelector('tr[data-permissionid="'+id+'"]');
//                            
//                            if (sourceRow) {
//                                // Clone dòng đã tìm thấy
//                                let clonedRow = sourceRow.cloneNode(true);
//      
//                                // Chèn vào bảng tableChoice
//                                let a = clonedRow.closest('tr');
//                                if(a){
//                                    const cell = a.querySelector('td');
//                                    const rowContent = cell.textContent;
//                                    existingContent.add(rowContent);
//                                    addRowToTableChoice(rowContent);
//                                }
//                            }
//                        });
                        
                    }
                });
</script>
