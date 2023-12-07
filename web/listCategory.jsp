<%-- 
    Document   : listCategory
    Created on : Oct 10, 2023, 9:33:18 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Danh Mục</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form action="add-category" id="Productform" method="POST">

        <div class="modal-body">
            <input type="hidden" name="idCategory" id="idCategory"> 
            <div class="form-group">

                <label> Tên Danh Mục </label>
                <input type="text" name="nameCategory" id="nameCategory" class="form-control" placeholder="Enter Category name">
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Mục Sản Phẩm 
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile" id="add-btn">
              Thêm Danh Mục
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
            <th> Tên Danh Mục </th>
            <th>Cập nhật</th>
            <th>Xóa</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idCategory } </td>
                    <td>  ${c.nameCategory} </td>
                    
                     <td >  <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button> 
                         
                         
                     </td>
                     <td>
                         <form action="delete-category" method="POST">
                             <input type="hidden" name="idCategory" value="${c.idCategory}">
                             <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                         </form>
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
                    else if(e.target && e.target.id === 'add-btn'){
                        let form = document.getElementById('Productform');
                        form.action='add-category';
                        document.getElementById("idCategory").value = "";

                        document.getElementById("nameCategory").value = "";
                    }
                    
                });
</script>

<!-- /.container-fluid -->

<%@include file="component/footer.jsp" %>