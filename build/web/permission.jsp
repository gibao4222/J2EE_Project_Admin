<%-- 
    Document   : permission
    Created on : Oct 11, 2023, 8:41:54 PM
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
      <div class="modal-content" style="width: 750px; align-content: center">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm Nhóm Quyền </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
          <form id="permissionForm" action="add-PermissionGroup" method="POST">

        <div class="modal-body">
            <input type="hidden" name="idGroup" id="idGroup" value="">
            <div class="form-group">
                <label> Tên Nhóm Quyền </label>
                <input type="text" style="margin: auto; width: 90%" name="nameGroup" id="nameGroup" class="form-control" placeholder="Enter Name Group Permission">
            </div>
             

            <div class="form-group">
                <label>Mô Tả</label>
                <input type="text" style="margin: auto; width: 90%" name="portray" id="portray" class="form-control" placeholder="Enter Portray for Group Permission">
            </div>
            <div class="form-group">
                <div class="container-fluid" style="display: flex; justify-content: space-between; gap: 10px;">
                    <div class="card shadow mb-4"style="max-width: 300px;">
                        <div class="card-body" >
                            <div class="table-responsive table-Cover">
                                <table class="table table-bordered table-ScrollBar" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Danh Sách Quyền
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${dataPermission}" var="c">
                                        <tr data-permissionid="${c.idPermission}">
                                           
                                                <td> ${c.idPermission} | ${c.namePermission} | ${c.portray}</td>
                                            
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4" style="max-width: 300px;">
                        <div class="card-body">
                            <div class="table-responsive table-Cover">
                                <table class="table table-bordered table-ScrollBar" id="tableChoice" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Danh Sách Quyền Đã Chọn
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
                
                
                
            </div>
            <input type="hidden" id="permissionIDs" name="listPermissionID" class="form-control">
        
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" name="registerbtn" id="btn-Save" class="btn btn-primary">Save</button>
        </div>
      </form>

    </div>
  </div>
</div>

















<div class="container-fluid">

<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Nhóm Quyền
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Nhóm Quyền
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            <th>Tên Nhóm Quyền </th>
            <th>Mô Tả</th>
            <th>Thao Tác</th>
          </tr>
        </thead>
        <tbody>
            <c:forEach items="${dataPermissionGroup}" var="pg">
          <tr>
            <td> ${pg.idGroup} </td>
            <td> ${pg.nameGroup}</td>
            <td> 
                ${pg.portray} 
            </td>
            
            <td>
                <input type="hidden" name="listPermission" id="listPermission" value="${pg.listPermission}">
                <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile"> Chỉnh sửa</button>
                <form action="delete-PermissionGroup" method="post">
                  <input type="hidden" name="idGroup" value="${pg.idGroup}">
                  <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa Nhóm Quyền</button>
                </form>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>

    </div>
  </div>
</div>

</div>

        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var table = document.getElementById('dataTable');
                
                var tableChoice = document.getElementById('tableChoice');

                const existingContent = new Set();
                
                table.addEventListener('click',function(event){
                    const targetRow = event.target.closest('tr');
                    if(targetRow){
                        const cell = targetRow.querySelector('td');
                        const rowContent = cell.textContent;
                        if(existingContent.has(rowContent)){
                            return;
                        }
                        existingContent.add(rowContent);
                        addRowToTableChoice(rowContent);

                    }
                });
                
                function addRowToTableChoice(data){
                    const newRow = tableChoice.querySelector('tbody').insertRow();
                    const cell = newRow.insertCell(0);
                    cell.textContent = data;
                }
                tableChoice.addEventListener('click',function(event){
                    const targetRow = event.target.closest('tr');
                    if(targetRow){
                        const cell = targetRow.querySelector('td');
                        const rowContent = cell.textContent;
                        existingContent.delete(rowContent);
                        targetRow.parentNode.removeChild(targetRow);
                    }
                });
                function addRowToTable(data){
                    const newRow = table.querySelector('tbody').insertRow();
                    const cell = newRow.insertCell(0);
                    cell.textContent = data;
                }
                const btnSave = document.getElementById('btn-Save');
                btnSave.addEventListener('click',function(){
                    let selectedRows = document.querySelectorAll('#tableChoice tbody tr');
                    let permissionIdsArray = [];
                    selectedRows.forEach(function(row){
                        let rowData = row.textContent.trim();
                        let permissionId = rowData.split('|')[0].trim();
                        permissionIdsArray.push(permissionId);
                    });
                    let permissionString  = permissionIdsArray.join(',');
                    document.getElementById("permissionIDs").value = permissionString;
                });
                
                //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('permissionForm');
                        form.action='update-PermissionGroup';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idGroup").value = row.cells[0].innerText;
                        document.getElementById("nameGroup").value = row.cells[1].innerText;
                        document.getElementById("portray").value = row.cells[2].innerText;
                        let permissionCell = row.cells[3];
                        let permissionInput = permissionCell.querySelector('input');
                        let str = permissionInput ? permissionInput.value : '';
                        let list = str.split(',');
                        existingContent.clear();
                        list.forEach(function(id){
                            //Tìm dòng trong bảng table có mã tương tự
                            let sourceRow = table.querySelector('tr[data-permissionid="'+id+'"]');
                            
                            if (sourceRow) {
                                // Clone dòng đã tìm thấy
                                let clonedRow = sourceRow.cloneNode(true);
      
                                // Chèn vào bảng tableChoice
                                let a = clonedRow.closest('tr');
                                if(a){
                                    const cell = a.querySelector('td');
                                    const rowContent = cell.textContent;
                                    existingContent.add(rowContent);
                                    addRowToTableChoice(rowContent);
                                }
                            }
                        });
                        
                    }
                });
                
                
//                function updateData(actionUrl){
//                    var xhr = new XMLHttpRequest();
//                    
//                    xhr.onreadystatechange() = function(){
//                        if(xhr.readyStatus === XMLHttpRequest.DONE){
//                            if(xhr.status === 200){
//                                var response = JSON.parse(xhr.responseText);
//                                alert(response.message);
//                                
//                                refreshPageContent();
//                            } esle{
//                                console.error('Lỗi khi gửi yêu cầu:'+xhr.status);
//                            }
//                        };
//                        xhr.open('POST',actionUrl,true);
//                        xhr.send();
//                    }
//                    
//                }
//                
//                function refreshPageContent(){
//                    
//                }
            });
        </script>