<%-- 
    Document   : productDetail
    Created on : Nov 27, 2023, 4:04:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="component/navbar.jsp" %>

<style type="text/css">

.rows {
display: flex;
flex-wrap: wrap;
margin-right: -.100rem;
margin-left: -.75rem;
}
.scroll{
  height: 400px;
  overflow: scroll;
}
h6{
  margin-top: 10px;
  /*margin-left: 80px;*/
  color: black;
  width: 80%;
  text-align: justify;
}
h3{
  margin-left: 80px;
  color: red;
  font-weight: bold;
}
#redd{
  color: red;
  font-weight: bold;
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
</style>

<!-- Begin editproduct -->
<div class="modal fade" id="editproduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cập Nhât Sản Phẩm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="save-product" id="Productform" method="POST" enctype="multipart/form-data">
      <div class="modal-body">
          <input type="hidden" name="IdProduct" id="IdProduct">
            <div class="form-group">

                <label> Name Product </label>
                <input type="text" name="nameProduct" id="nameProduct1" class="form-control" placeholder="Enter Product">
            </div>
             <div class="form-group">

                 <div class="form-group">

                <label>category </label>
                <select name="id_category" id="id_category" class="form-control">
                    <c:forEach items="${cate}" var="v">
                        <option value="${v.idCategory }">${v.nameCategory}</option>
                     </c:forEach>
                </select>
            </div>
            </div>
             <div class="form-group">

                <label> introduce </label>
                <textarea class="form-control" rows="5" name="introduce" id="introduce1" placeholder="Enter introduce"></textarea>
            </div>
             <div class="form-group">

                <label> Ảnh </label>
                <img id="previewImage" src="resources/img/${productDetail.image}" width="80px" style="margin-bottom: 5px">
                    <input type="file" name="image" id="img" class="form-control" onchange="previewFile(event)" >
            </div>

                 <div class="form-group">

                <label> size </label>
                <input type="text" name="size" id="size1" class="form-control" placeholder="Enter size">
            </div>
            
            <label> stuff </label>
            <input type="text" name="stuff" id="stuff1" class="form-control" placeholder="Enter stuff">
          
            <div class="form-group">

                <label> Quantity </label>
                <input type="number" name="quantity" id="quantity1" class="form-control" placeholder="Enter quantity">
            </div>
                <div class="form-group">

                <label> Price </label>
                <input type="text" name="price" id="price1" class="form-control" placeholder="Enter price" oninput="formatAndDisplayCurrency(this)">
                <script>
            // Biến để lưu giữ giá trị gốc
        let originalValue;

        function formatAndDisplayCurrency(input) {
            // Lấy giá trị nhập vào từ người dùng
            let inputValue = input.value;

            // Nếu giá trị gốc chưa được lưu, lưu giá trị gốc
            if (originalValue === undefined) {
                originalValue = inputValue;
            }

            // Xóa tất cả các ký tự không phải số
            inputValue = inputValue.replace(/\D/g, '');

            // Định dạng số theo kiểu tiền tệ VNĐ
            let formattedValue = Number(inputValue).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });

            // Gán giá trị đã định dạng vào ô input
            input.value = formattedValue;
        }

        // Sự kiện để kiểm tra nếu người dùng nhấn nút xóa (backspace)
        document.getElementById('price1').addEventListener('keydown', function(event) {
            if (event.key === 'Backspace') {
                // Khôi phục giá trị gốc khi người dùng nhấn nút xóa
                this.value = 0;
            }
        });
    </script>
            </div>
            
            <div class="form-group">

                <label> portray </label>
                <textarea class="form-control" rows="5" name="portray" id="portray1" placeholder="Enter portray" ></textarea>
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
            <button type="submit" name="registerbtn" class="btn btn-primary" id="btn-save">Lưu</button>
        </div>
      </form>

    </div>
  </div>
</div>
<!-- End editproduct -->
<!-- Begin addsize -->
<div class="modal fade" id="addmota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cập nhật ảnh phụ</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="add-subimage" id="addSubImage" method="POST" enctype="multipart/form-data">

        <div class="modal-body">
              <ul class="list-group mb-3 "id="sortable1">
              <li class="list-group-item">
                <div class="form-row align-items-start">
                  <div class="col-md-12">
                    <label class="" for="idProduce_SubImg">Mã Sản Phẩm</label>
                    <input type="hidden" class="form-control mb-2 mr-sm-2" id="idSubImg" name="idSubImg" placeholder="Title" value="" readonly>
                    <input type="text" class="form-control mb-2 mr-sm-2" id="idProduce_SubImg" name="idProduce_SubImg" placeholder="Title" value="${productDetail.idProduct}" readonly>
                  </div>
                  <div class="col-md-12">
                    <label>Image</label>
                    <img id="previewSubImage" src="" width="80px" style="margin-bottom: 5px">
                    <input type="file" name="imageSub" id="subImg" class="form-control" onchange="previewFileSub(event)" >
                    
                    
                  
                </div>
              </li>

              </ul>
              <!--<button class="btn btn-primary" onclick="addListItemMoTaProdDetail()">Add Item</button>-->

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" name="addMoTaProdDetail" class="btn btn-primary" >Lưu</button>
        </div>
      </form>

    </div>
  </div>
</div>

<!-- End addsize -->

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary" style="margin-left:80px;">Danh Sách Sản Phẩm
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editproduct" id="edit-btn">
              Cập Nhật Sản Phẩm
            </button>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addmota" id="add-SubImg-btn">
              Thêm ảnh phụ
            </button>
        
      </h6>
    </div>
    

    <div class="card-body">
     
      
     

     
        <div class="rows">
           
          <div class="col-4" >
              <img src="resources/img/${productDetail.image}" width="370px">
          </div>
          <div class=" col-8">
            <h3 class="m-0 font-weight-bold text-primary">${productDetail.idProduct} - ${productDetail.nameProduct}</h3>
            
             <h6>Giới thiệu: ${productDetail.introduce}</h6> 
            
            <h6>Danh mục: ${category}</h5>
           
             <h6>Kích thước: ${productDetail.size}</h6>
             
             <h6>Chất liệu: ${productDetail.stuff}</h6> 
             <h6>Mô tả: ${productDetail.portray}</h6>
             <h6>Số lượng: </h5>
             <form action="update-quantity" id="updateQuantity" method="POST">
                <div class="input-group">
                    <input type="hidden" name="idProduct" class="form-control" placeholder="Enter quantity" value="${productDetail.idProduct}" style="max-width: 150px">
                        <input type="text" name="quantity" class="form-control" placeholder="Enter quantity" value="${productDetail.quantity}" style="max-width: 150px">
                    <div class="input-group-btn">
                        <button class="btn btn-primary" type="submit" id="btn_update_quantity" >
                            Cập nhật
                        </button>
                    </div>
                </div>
            </form>
             
            <h6>Giá: ${productDetail.price} đ</h6>
            
              
          </div>
        </div>
        <form action="" method="post">
          
        <div class="scroll">
         
              <table class="table table-bordered" id="editable_table" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th> ID </th>
                    <!-- <th> Size </th> -->
                    <th> Ảnh Phụ </th>
                    
                    <th> Chỉnh Sửa </th>
                   
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${subList}" var="c">
                  <tr>
                    <td> ${c.idSubImage} </td>
                    <!-- <td> <?php //echo $result['size']?></td> -->
                   <td> 
                       <img src="resources/subimg/${c.subImage}" alt="alt" width="80px"/>
                    </td> 
                    
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addmota" id="editSubImg-btn">Cập nhật</button>
                        <form action="delete-subimage" method="POST">
                            <input type="hidden" value="${c.idProduct}" name="idProduct">
                            <input type="hidden" value="${c.idSubImage}" name="idSubImage">
                            <input type="submit" class="btn btn-danger" value="Xóa" name="action-Delete">
                        </form>
                     
                    </td>
                    
                  </tr>
                 
                    </c:forEach>
                  
                </tbody>
              </table>
              
               
            </div>
          
            </form>


       

      
    </div>

    
  </div>
</div>

<script>
    document.addEventListener('click',function (e){
        if(e.target && e.target.id==='edit-btn'){
//            alert("hello");
            document.getElementById("IdProduct").value = '${productDetail.idProduct}';

            document.getElementById("nameProduct1").value = '${productDetail.nameProduct}';
            document.getElementById("introduce1").value = `${productDetail.introduce}`;
//            document.getElementById("image1").value = row.cells[4].innerText; 
            document.getElementById("size1").value = '${productDetail.size}';
            document.getElementById("stuff1").value = '${productDetail.stuff}';
            document.getElementById("quantity1").value = '${productDetail.quantity}';

            document.getElementById("price1").value = '${productDetail.price}';
            document.getElementById("portray1").value = `${productDetail.portray}`;
        }
        else if(e.target && e.target.id==='editSubImg-btn'){
            let form = document.getElementById("addSubImage");
            form.action = 'save-subimage';
            let row = e.target.closest('tr');
            var parser = new DOMParser();
            var doc = parser.parseFromString(row.cells[1].innerHTML, 'text/html');
            var imgSrc = doc.querySelector('img').getAttribute('src');

            document.getElementById("previewSubImage").src = imgSrc;
            document.getElementById("idSubImg").value = row.cells[0].innerText;
        }
        else if(e.target && e.target.id==='add-SubImg-btn'){
            let form = document.getElementById("addSubImage");
            form.action = 'add-subimage';
            document.getElementById("idSubImg").value ="";
            document.getElementById("previewSubImage").src ="";
        }

    });
    $("#updateQuantity").submit(function(event){
        event.preventDefault();
        $.ajax({
                url: "/J2EE_Project_Admin/update-quantity",
                type: "post",
                data: $("#updateQuantity").serialize(),
                success: function (data){
                    try{
                        if(data.rs!==0){
                            alert("cập nhật thành công");
                        }
                    }catch(error){
                        console.error("Lỗi phân tích JSON:", error);
                    }
                },
                error: function (xhr) {
                }
            });
    });
    $("#Productform").submit(function (event){
        var fileInput = document.getElementById("img");
        if (!fileInput.files.length) {
        alert("Vui lòng chọn tệp!");
        event.preventDefault();
        return;
    }
    });
    $("#addSubImage").submit(function (event) {
    event.preventDefault();

    // Kiểm tra xem đã chọn tệp hay chưa
    var fileInput = document.getElementById("subImg");
    if (!fileInput.files.length) {
        alert("Vui lòng chọn tệp!");
        return;
    }
    
    if(this.action.split("/")[4] === 'add-subimage'){
       // Tiếp tục gửi form nếu mọi thứ đều ổn
    $.ajax({
        url: "/J2EE_Project_Admin/add-subimage",
        type: "post",
        data: new FormData($("#addSubImage")[0]),  // Sử dụng FormData để xử lý tệp
        contentType: false,
        processData: false,
        success: function (data) {
            try {
                if (data.rs !== 0) {
                    console.log(data.rs);
                }
            } catch (error) {
                console.error("Lỗi phân tích JSON:", error);
            }
        },
        error: function (xhr) {
            console.error("Lỗi Ajax:", xhr);
        }
    }); 
    }
    else if(this.action.split("/")[4] === 'save-subimage'){
        $.ajax({
        url: "/J2EE_Project_Admin/save-subimage",
        type: "post",
        data: new FormData($("#addSubImage")[0]),  // Sử dụng FormData để xử lý tệp
        contentType: false,
        processData: false,
        success: function (data) {
            try {
                if (data.rs !== 0) {
                    console.log(data.rs);
                }
            } catch (error) {
                console.error("Lỗi phân tích JSON:", error);
            }
        },
        error: function (xhr) {
            console.error("Lỗi Ajax:", xhr);
        }
    }); 
    }
    
    
});
    function previewFile(event){
        var previewImage = document.getElementById("previewImage");
        var fileInput = event.target.files[0];
        
        var reader = new FileReader();
        reader.onloadend = function () {
            previewImage.src = reader.result;
        };

        if (fileInput) {
            reader.readAsDataURL(fileInput);
        } else {
            previewImage.src = "";
        }
    }
    function previewFileSub(event){
        var previewImage = document.getElementById("previewSubImage");
        var fileInput = event.target.files[0];
        
        var reader = new FileReader();
        reader.onloadend = function () {
            previewImage.src = reader.result;
        };

        if (fileInput) {
            reader.readAsDataURL(fileInput);
        } else {
            previewImage.src = "";
        }
    }
    
</script>
<%@include file="component/footer.jsp" %>