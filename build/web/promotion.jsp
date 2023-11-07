<%-- 
    Document   : promotion
    Created on : Oct 14, 2023, 10:33:40 AM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.PromotionDetailDAL" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="component/navbar.jsp" %>


<div class="modal fade">
    <div class="modal-dialog" role="document">
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
            <input type="hidden" id="productStr" name="listProduct">
            
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" name="registerbtn" class="btn btn-primary" id="btn-Save">Lưu</button>
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile" id="add_btn">
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
                  <form action="load" method="post">
                      <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile" data-idPromo="${c.idPromo}">ê đít</button>
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
    //Hành động của table
    table = document.getElementById("dataTable");
    const listProduct = new Set();
    table.addEventListener('click',function(e){
       const targetRow = event.target.closest('tr');
       const idProduct = targetRow.getAttribute("data-productid");
       
       if(targetRow){
           const cell = targetRow.querySelector('td input');
           if(cell.checked)
               listProduct.add(idProduct);

           
       }
    });
    
    //Lưu
//    const btnSave = document.getElementById('btn-Save');
//    btnSave.addEventListener('click',function(){
//       let productList=Array.from(listProduct);
//       let productStr="";
//       for(var i=0;i<listProduct.size;i++){
//           if(i<listProduct.size-1){
//               productStr+=productList[i]+",";
//           }
//           else{
//               productStr+=productList[i];
//           }
//       }
//       
//       document.getElementById("productStr").value = productStr;
//    });

    //Thêm và Cập nhật
                document.addEventListener('click',function(e){
                        if(e.target && e.target.id ==='btn-Save'){
                            
                            let productList=Array.from(listProduct);
                            let productStr="";
                            for(var i=0;i<listProduct.size;i++){
                                if(i<listProduct.size-1){
                                    productStr+=productList[i]+",";
                                }
                                else{
                                    productStr+=productList[i];
                                }
                            }
       
                            document.getElementById("productStr").value = productStr;
                        }
                        else if(e.target && e.target.id ==='edit_btn'){
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
                            
                            
//                            // Dữ liệu bạn muốn thêm vào URL
//                            var dataToAdd = row.cells[0].innerText;
//
//                            // Hiện tại URL
//                            var currentURL = window.location.href;
//
//                            // Xây dựng URL mới bằng cách thêm dữ liệu vào URL hiện tại
//                            var newURL ="?data=" + dataToAdd;
//
//                            window.history.pushState({ path: currentURL+newURL }, '', newURL);                            
                            
                                  
                            $.ajax({
                                url: "/J2EE_Project_Admin/load",
                                type: "get", //send it through get method
                                data: {
                                    
                                },
                                success: function (data) {
//                                    var dataa = ${data};
//                                    alert(dataa.length);
                                },
                                error: function (xhr) {
                                    alert("kho load");
                                    //Do Something to handle error
                                }
                            });
                            
                                                            
                        }
                        else if(e.target && e.target.id ==='add_btn'){
                                    document.getElementById("idPromo").value = "";
                            document.getElementById("namePromo").value = "";
                            document.getElementById("code").value = "";
                            document.getElementById("dateStart").value = "";
                            document.getElementById("dateEnd").value = "";
                            document.getElementById("saleOff").value = "";
                            document.getElementById("reduceMax").value = "";
                        }
//                            };
//                // Cập nhật modal với thông tin promotionDetail
//                // Ví dụ: document.getElementById('promotionDetailField').value = promotionDetailData.field;
//                            xhr.send();
//                            
//                        }
                            
                    });
                    
            
                    
 
</script>

<%@include file="component/footer.jsp" %>

