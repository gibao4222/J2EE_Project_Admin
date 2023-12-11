<%-- 
    Document   : listSupplier
    Created on : Oct 10, 2023, 8:56:08 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm mã giảm giá</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
     
      <form id= "SupplierForm" action="add-Promotion" method="POST">
        <input type="hidden" name="idPromo" id="idPromo" >
        <div class="modal-body">

            <div class="form-group">

                <label> namePromo </label>

                <input type="text" id="namePromo" name="namePromo" class="form-control" placeholder="Enter namePromo">
                
            </div>
            
            <div class="form-group">

                <label> date start </label>

                <input type="date"id="dateStart" name="dateStart" class="form-control" placeholder="Enter dateStart">
                
            </div>
            
            <div class="form-group">

                <label> date End	 </label>

                <input type="date" id="dateEnd" name="dateEnd" class="form-control" placeholder="Enter dateEnd">
                
            </div>
             <div class="form-group">

                <label> saleOff	 </label>

                <input type="text" id="saleOff" name="saleOff" class="form-control" placeholder="Enter SaleOff">
                
            </div>
             <div class="form-group">

                <label> priceMax </label>

                <input type="text" id="priceMax" name="priceMax" class="form-control" placeholder="Enter PriceMax">
                
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
    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Mã giảm giá
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
             Thêm Mã giảm giá
            </button>
    </h6>
  </div>

  <div class="card-body">

    <div class="table-responsive">

     <!--<form action="Supplier" method="POST">-->
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> idSale  </th>
            <th> namePromo </th>
            <th> Date start</th>
            <th> Date end</th>
           
            <th> saleOff </th>
            <th> priceMax </th>
            <th>Chỉnh Sửa </th>
          </tr>
        </thead>
        <tbody>
              <c:forEach items="${dataPromotion}" var="c">
          <tr>
            <td> ${c.idSale}</td>
            
             <td> ${c.namePromo}</td>
            <td> ${c.dateStart} </td>
            <td>  ${c.dateEnd}</td>
            <td> ${c.saleOff}<input id="rowReduceMax" value="${c.reduceMax}" type="hidden"></td>
                <td>${c.reduceMax}
                    </td>
            <td>
                <form action="delete-Promotion" method="POST">
                    <input type="hidden" name="idPromo" id="idPromo" value="${c.idSale}">
                  <button  type="submit" name="delete_btn" class="btn btn-danger">Delete</button>
                </form>
                  <form action="load" method="post">
                      <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile" data-idPromo="${c.idSale}">edit</button>
                  </form>
                
                
                
            </td>
          </tr>
        </c:forEach>
<!--          <tr>
          
            
          </tr>-->
        </tbody>
      </table>
       <!--</form>-->

    </div>
  </div>
</div>

</div>
<script>
                 document.addEventListener('DOMContentLoaded', function() {
                var table = document.getElementById('dataTable');
            
                const existingContent = new Set();
                
               
              
                
                //Cập nhật
                document.addEventListener('click',function(e){
                    if(e.target && e.target.id === 'edit_btn'){
                        
                        let form = document.getElementById('SupplierForm');
                        form.action='update-Promotion';
                        
                        
                        let row = e.target.closest('tr');
                        
                        document.getElementById("idPromo").value = row.cells[0].innerText;                        
                        document.getElementById("namePromo").value = row.cells[1].innerText;
                        document.getElementById("dateStart").value = row.cells[2].innerText;
                        document.getElementById("dateEnd").value = row.cells[3].innerText;
                        document.getElementById("saleOff").value = row.cells[4].innerText;
                        document.getElementById("priceMax").value = row.cells[5].innerText;

                        existingContent.clear();
                                                
                    }
                });

            });
</script>
<%@include file="component/footer.jsp" %>