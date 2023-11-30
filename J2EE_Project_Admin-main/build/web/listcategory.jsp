<%-- 
    Document   : listProduct
    Created on : Oct 10, 2023, 9:27:36 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
<style type="text/css">
  .scroll{
  height: 700px;
  overflow: scroll;
}
.image-input {
  text-aling: center;
}
.image-input input {
  display: none;
}
.image-input label {
  display: block;
  color: #FFF;
  background: #000;
  padding: 0.3rem 0.6rem;
  font-size: 115%;
  cursor: pointer;
}
.image-input label i {
  font-size: 125%;
  margin-right: 0.3rem;
}
.image-input label:hover i {
  animation: shake 0.35s;
}
.image-input img {
  max-width: 175px;
  display: none;
}
.image-input span {
  display: none;
  text-align: center;
  cursor: pointer;
}

@keyframes shake {
  0% {
    transform: rotate(0deg);
  }
  25% {
    transform: rotate(10deg);
  }
  50% {
    transform: rotate(0deg);
  }
  75% {
    transform: rotate(-10deg);
  }
  100% {
    transform: rotate(0deg);
  }
}

</style>


<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Sản Phẩm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
      <form action="add-category" id="Productform" method="POST">

        <div class="modal-body">
            <input type="hidden" name="idCategory" id="idCategory">
            <div class="form-group">

                <label> Name category </label>
                <input type="text" name="nameCategory" id="nameCategory" class="form-control" placeholder="Enter Category">
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Danh mục 
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
             Thêm Danh mục
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

      <div class="scroll">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
         <tr>
            <th> ID </th>
            <th>Name Category</th>   
                 
          </tr>
        </thead>
        <tbody>

          <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idCategory } </td>
                    <td>  ${c.nameCategory} </td>
                    
                     <td >  <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button> <a href="delete-category?id=<c:out value="${c.idCategory}"/>">delete</a></td>
                    
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
                        form.action='save-category';
                        
                        
                        let row = e.target.closest('tr');
                        document.getElementById("idCategory").value = row.cells[0].innerText;

                        document.getElementById("nameCategory").value = row.cells[1].innerText;
                        
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
</script><script>
     //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('Productform');
                        form.action='save-category';
                        
                        
                        let row = e.target.closest('tr');
                        document.getElementById("idCategory").value = row.cells[0].innerText;

                        document.getElementById("nameCategory").value = row.cells[1].innerText;
                        
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
<script>
     //Cập nhật
     
//                document.addEventListener('click',function(e){
                    
//                    if(e.target && e.target.id === 'edit-btn'){
//                        
//                        let form = document.getElementById('Productform');
//                        form.action='save-product';
//                        
//                        
//                        let row = e.target.closest('tr');
//                        document.getElementById("IdProduct").value = row.cells[0].innerText;
//
//                        document.getElementById("nameProduct1").value = row.cells[1].innerText;
//                        document.getElementById("introduce1").value = row.cells[2].innerText;
////                        document.getElementById("image1"). = row.cells[3].innerText; 
//                        document.getElementById("size1").value = row.cells[4].innerText;
//                        document.getElementById("stuff1").value = row.cells[5].innerText;
//                        document.getElementById("quantity1").value = row.cells[6].innerText;
//                        document.getElementById("price1").value = row.cells[8].innerText;
//                        document.getElementById("portray1").value = row.cells[7].innerText;
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
                        
//                    }
//                    else if(e.target && e.target.id === 'btn-save'){
//                        e.preventDefault();
//                        $.ajax({
//                            url:"/J2EE_Project_Admin/add-product",
//                            type: 'POST',
//                            data: ${'#Productform'}.seriablize(),
//                            success: function (response) {
//                                alert("Add thành công");
//                            }
//                        });
//                    }
//                });
        
</script>
<%@include file="component/footer.jsp" %>