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
     
        <form action="add-product" id="Productform" method="POST">

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
                <!--<input type="text" name="image1" id="image1" class="form-control" style="display: none">-->
                <div class="image-input">
                    <input type="file" accept="image/*" id="image" name="image">
                    <label for="image" class="image-button"><i class="far fa-image"></i> Choose image</label>
                    <img src="" class="image-preview" id="nameImg">
                    <span class="change-image">Choose different image</span>
                </div>
            </div>
                 <div class="form-group">

                <label> size </label>
                <input type="text" name="size" id="size1" class="form-control" placeholder="Enter size">
            </div>
            
            <label> stuff </label>
            <input type="text" name="stuff" id="stuff1" class="form-control" placeholder="Enter stuff">
          
            <div class="form-group">

                <label> Quantity </label>
                <input type="text" name="quantity" id="quantity1" class="form-control" placeholder="Enter quantity">
            </div>
             <div class="form-group">

                <label> Color </label>
                <input type="text" name="color" id="color1" class="form-control" placeholder="Enter color">
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
            <button type="submit" name="registerbtn" class="btn btn-primary" id="btn-save">Lưu</button>
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

      <div class="scroll">

      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th> ID </th>
            
            <th>category</th>
            <th>nameProduct</th>  
                    <th>introduce</th>
                    <th>image</th>
                    <th>size</th>
                    <th>stuff</th>
                    <th>quantity</th>
                    <th>portray</th>
                    <th>color</th>
                    <th>price</th>
                    <th >Action</th>
          </tr>
        </thead>
        <tbody>

          <c:forEach items="${data}" var="c">
                <tr>
                    <td>  ${c.idProduct} </td>
                   <td>  ${c.idCategory} </td>
                    <td>  ${c.nameProduct} </td>
                     
                     <td>  ${c.introduce} </td>
                     <td>  ${c.image} </td>
                     <td>   ${c.size}  </td>
                    
                     <td>  ${c.stuff}  </td>
                     <td>   ${c.quantity}  </td>
                     <td>   ${c.portray}  </td>
                     <td>   ${c.color}  </td>
                     <td>   ${c.price}  </td>
                     <td> 
                         <button name="edit-btn" id="edit-btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button>
                         <form action="delete-Product" method="post">
                            <input type="hidden" name="idProduct" value="${c.idProduct}">
                            <button type="submit" name="delete-btn" class="btn btn-danger">delete</button>
                         </form>
                         
                     </td>

                    
                     <!--<td >  <button  type="button" name="edit_btn" id="edit_btn" class="btn btn-success" data-toggle="modal" data-target="#addadminprofile">update</button> <a href="delete-product?id=<c:out value="${c.idProduct}"/>"</a>delete</td>-->
                    
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
    
    document.addEventListener('click',function (e){
        if(e.target && e.target.id==='edit-btn'){
            let form = document.getElementById('Productform');
            form.action='save-product';
                        
                        
            let row = e.target.closest('tr');
            document.getElementById("IdProduct").value = row.cells[0].innerText;

            document.getElementById("nameProduct1").value = row.cells[2].innerText;
            document.getElementById("introduce1").value = row.cells[3].innerText;
//            document.getElementById("image1").value = row.cells[4].innerText; 
            document.getElementById("size1").value = row.cells[5].innerText;
            document.getElementById("stuff1").value = row.cells[6].innerText;
            document.getElementById("quantity1").value = row.cells[7].innerText;
            document.getElementById("color1").value = row.cells[9].innerText;

            document.getElementById("price1").value = row.cells[10].innerText;
            document.getElementById("portray1").value = row.cells[8].innerText;
            var originalSelect = document.getElementById('id_category');
    

            var selectedValue = row.cells[1].innerText; // Lấy giá trị của tùy chọn được chọn

            // Duyệt qua các tùy chọn trong thẻ <select> trong biểu mẫu và đặt thuộc tính "selected" cho tùy chọn tương ứng
            for (var i = 0; i < originalSelect.options.length; i++) {
                if (originalSelect.options[i].value === selectedValue) {
                    originalSelect.options[i].selected = true;
                }
            }
            var fakeFileInput = document.createElement('input');
            var fakeFile = new File([fakeFileInput], 'leuleu', { type: 'image/jpeg' });
            
		fileReader = new FileReader();
		fileReader.onload = function (data) {
		$('.image-preview').attr('src', "./resources/img/"+row.cells[4].innerText );
		}
		fileReader.readAsDataURL(fakeFile);
		$('.image-button').css('display', 'none');
		$('.image-preview').css('display', 'block');
		$('.change-image').css('display', 'block');
            

            
        }
        else if(e.target && e.target.id==='btn-save'){
            var form = document.getElementById('Productform');

            var action =form.action.split("/")[4];
            if(action==='save-product'){
//                var img1 = document.getElementById("image1").value;
                let img = document.getElementById("image");
                let name = document.getElementById("nameImg").src.split("/")[6];
                var fileInput = document.getElementById('image');

            // Kiểm tra xem có tệp tin được chọn hay không
            if (fileInput.files.length > 0) {
                // Lấy đối tượng File đầu tiên trong danh sách files
                var file = fileInput.files[0];
//
//                // Hiển thị tên của tệp tin
                alert('File Name: ' + file.name);

//                document.getElementById("image1").style.display='none';
            } else {
                alert("chưa đổi");
//                document.getElementById("image").style.display='none';
            }
        }
        }
    });
//    $('#btn-save').on('click',function(){
//        let form = document.getElementById('Productform');
//        if(form.action==='save-product'){
////            let img1 = document.getElementById("image1");
////            let img = document.getElementById("image");
////            let name = $('.image-preview').src.split("/")[3];
//            alert("hello");
//        }
//            
//    });
    $('#image').on('change', function() {
	$input = $(this);
	if($input.val().length > 0) {
		fileReader = new FileReader();
		fileReader.onload = function (data) {
		$('.image-preview').attr('src', data.target.result);
		}
		fileReader.readAsDataURL($input.prop('files')[0]);
		$('.image-button').css('display', 'none');
		$('.image-preview').css('display', 'block');
		$('.change-image').css('display', 'block');
	}
});
						
$('.change-image').on('click', function() {
	$control = $(this);			
	$('#image').val('');	
	$preview = $('.image-preview');
	$preview.attr('src', '');
	$preview.css('display', 'none');
	$control.css('display', 'none');
	$('.image-button').css('display', 'block');
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