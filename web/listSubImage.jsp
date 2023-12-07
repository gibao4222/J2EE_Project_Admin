<%-- 
    Document   : listSubImage
    Created on : Nov 24, 2023, 9:00:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
        <form action="add-subimage" id="Productform" enctype="multipart/form-data">

        <div class="modal-body">
            <input type="hidden" name="idSubImage" id="idSubImage">
            
             <div class="form-group">

                <label>Product </label>
                <select name="idProduct" id="idProduct">
                    <c:forEach items="${pro}" var="c">
                        <option value="${c.idProduct}">${c.nameProduct}</option>
                     </c:forEach>
                </select>
            </div>
             <div class="form-group">

                <label> subImage </label>
                <input type="file" id="fileInput" name="files[]" multiple>
            </div>
             <div class="form-group">

                <label> note </label>
                <input type="text" name="note" id="note" class="form-control" placeholder="Enter Product">
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Subimage
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
             Thêm Subimage
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
            <th> idSubImage  </th>
            <th>idProduct</th>  
            <th>subImage</th>  
            <th>note</th>  

            
                 
          </tr>
        </thead>
        <tbody>

       <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idSubImage} </td>
                    <td>  ${c.idProduct} </td>
                     <td>  ${c.subImage} </td>
                     <td>  ${c.note} </td>
                    
                    
                     <td >  <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button> <a href="delete-subimage?id=<c:out value="${c.idSubImage}"/>">delete</a></td>
                    
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
                        form.action='save-subimage';
                        
                        
                        let row = e.target.closest('tr');
                        document.getElementById("idSubImage").value = row.cells[0].innerText;

                        document.getElementById("idProduct").value = row.cells[1].innerText;
                         document.getElementById("subImage").value = row.cells[2].innerText;

                        document.getElementById("note").value = row.cells[3    ].innerText;

                        
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
<%@include file="component/footer.jsp" %>