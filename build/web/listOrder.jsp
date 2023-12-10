<%-- 
    Document   : listOrder
    Created on : Oct 7, 2023, 7:22:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>
<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <!--        <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        
                      </div>
                     
                      <form action="" method="POST">
                
                        <div class="modal-body">
                
                            <div class="form-group">
                
                                <label> Trạng thái </label>
                                <input type="hidden" name="test" id="test"  value="">
                                 <input type="text" name="brandName" class="form-control" placeholder="Enter Brand"> 
                                <select class="form-control"  id="status" name="status">
                                    
                                  
                                        <option  selected value="0">Đang Xử Lý</option>
                                        <option value="1">Đang Giao Hàng</option>
                                        <option value="2">Thành Công</option>
                                        <option value="3">Xóa Đơn</option>
                                   
                                  </select>
                                
                            </div>
                            
                        
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" name="submit" class="btn btn-primary">Lưu</button>
                        </div>-->
                <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái đơn hàng </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id= "OrderForm" name="idOrder" action="update-Status-Order" method="POST">
                <div class="modal-body">

            <div class="form-group">

                <label> Trạng thái </label>
                <input type="hidden" name="idOrder" id="idOrder"  value="">
                <!-- <input type="text" name="brandName" class="form-control" placeholder="Enter Brand"> -->
                <select class="form-control"  id="status" name="status">
                    
                  
                        <option  selected value="0">Đang Xử Lý</option>
                        <option value="1">Đang Giao Hàng</option>
                        <option value="2">Giao Thành Công</option>
                        <option value="3">Hủy Đơn Hàng</option>
                   
                  </select>
                
            </div>
            
        
        </div>
              
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="registerbtn"  class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Đơn Hàng
<!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
              Thêm Đơn Hàng
            </button>-->
<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm float-right" onclick="exportToExcel()"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
            </h6>

        </div>

        <div class="card-body">
            <!--  <form action="" method="post">-->


            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable"  width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th width="15%">Khách Hàng </th>
                            <th> Ngày Đặt </th>

                            <th>Tổng Tiền</th>

                            <th width="15%">Trạng Thái </th>
                            <th>Thao Tác</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${data}" var="order">
                            <tr>
                                <td>${order.idOrder}</td>
                                <td>${order.idCustomer}</td>
                                <td>${order.dateCreated}</td>
                                <td>${order.totalBill}</td>
                                
                                <c:choose>
                                    <c:when test="${order.status == 0}">
                                        <td>Đang Xử Lý</td>
                                    </c:when>
                                    <c:when test="${order.status == 1}">
                                        <td>Đang Giao Hàng</td>
                                    </c:when>
                                    <c:when test="${order.status == 2}">
                                        <td style="color: blue">Giao Thành Công</td>
                                    </c:when>
                                    <c:when test="${order.status == 3}">
                                        <td style="color: red">Hủy Đơn Hàng</td>
                                    </c:when>

                                </c:choose>                                <td>
                                    <form action="" method="post">
                                        <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                                        <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile" data-status="${order.status}"> Cập nhật trạng thái </button>
                                        <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                                    </form>
                                </td>
<!--                                <td>
                                    <form action="delete-Order" method="post">
                                       
                                        <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                                         <input type="hidden" name="idOrder" value="${order.idOrder}">
                                    </form>
                                </td>-->
                            </tr>
                        </c:forEach>






                        <!--            <td>-->



                        <!--                  <input  id="edit" type="button" name="submit" class="btn btn-primary" value="Cập nhật trạng thái" data-toggle="modal" data-target="#addadminprofile">-->

                        <!--               
                                    </td>-->
                        <!--          </tr>-->

                    </tbody>
                </table>  

            </div>
            <!--  </form>-->
            <div class="form-group float-right mr-lg-5">
    <label for="filterDate">Ngày đặt:</label>
    <input type="date" class="form-control mb-2" id="filterDate" name="filterDate">
    <button type="button" class="btn btn-primary " onclick="filterOrders()">Lọc</button>
    <button type="button" class="btn btn-secondary " onclick="CancelFilter()">Hủy</button>

</div>

        </div>
    </div>

</div>

<!--<script>
  $(document).ready(function(){
    
    $("#dataTable").on('click','#edit',function(){
      
      var currentRow = $(this).closest("tr");
      var id=currentRow.find("td:eq(0)").text();
      // var status=currentRow.find("td:eq(5)").val(); 
      
      // var show = id;
      // alert(show);
      $("#test").val(id);
      // $("#statuss").val(matp);
    });
 });
  
  
</script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        




        //Cập nhật
        document.addEventListener('click', function (e) {
            if (e.target && e.target.id === 'edit_btn') {


                let row = e.target.closest('tr');

                document.getElementById("idOrder").value = row.cells[0].innerText;
                
                var originalSelect = document.getElementById('status');
                var selectedText = row.cells[4].innerText;
                var selectedValue =0;
                switch(selectedText){
                    case "Đang Xử Lý":
                        selectedValue = 0;
                        break;
                    case "Đang Giao Hàng":
                        selectedValue = 1;
                        break;
                    case "Giao Thành Công":
                        selectedValue = 2;
                        break;
                    case "Hủy Đơn Hàng":
                        selectedValue = 3;
                        break;
                }
                // Duyệt qua các tùy chọn trong thẻ <select> trong biểu mẫu và đặt thuộc tính "selected" cho tùy chọn tương ứng
                for (var i = 0; i < originalSelect.options.length; i++) {
                    if (originalSelect.options[i].value == selectedValue) {
                        originalSelect.options[i].selected = true;
                    }
                }


            }
            
        });
        check();
        
        
    });
    function check(){
        var editButtons = document.querySelectorAll('#edit_btn');
        editButtons.forEach(function (button) {
            // Lấy giá trị của status từ data-status
            var status = button.getAttribute('data-status');
            // Kiểm tra giá trị status và tắt nút nếu là 2 hoặc 3
            if (status === '2' || status === '3') {
                button.disabled = true;
            }
        });
    }
    function filterOrders() {
        var filterDate = document.getElementById('filterDate').value;

        // Gửi yêu cầu AJAX đến server để lấy danh sách hóa đơn theo ngày
        // Dựa vào kết quả trả về để cập nhật giao diện (ví dụ: thông qua jQuery)
        $.ajax({
            url: "/J2EE_Project_Admin/filterDate",
            type: 'POST',
            data: { filterDate: filterDate },
            dataType: "json",
            success: function (data) {
                console.log(data);
                // Cập nhật giao diện với dữ liệu mới
                updateTable(data);
            },
            error: function (xhr) {
                console.error("Lỗi khi gửi yêu cầu đến Servlet:", xhr);
            }
        });
    }
    function CancelFilter() {

        // Gửi yêu cầu AJAX đến server để lấy danh sách hóa đơn theo ngày
        // Dựa vào kết quả trả về để cập nhật giao diện (ví dụ: thông qua jQuery)
        $.ajax({
            url: "/J2EE_Project_Admin/order",
            type: 'GET',
            dataType: "json",
            data: { status: 'ajax' },
            success: function (data) {
                // Cập nhật giao diện với dữ liệu mới
                updateTable(data);
            },
            error: function (xhr) {
                console.error("Lỗi khi gửi yêu cầu đến Servlet:", xhr);
            }
        });
    }
    function updateTable(data) {
        // Xóa các dòng hiện tại trong bảng
        $("#dataTable tbody").empty();

        // Thêm các dòng mới từ dữ liệu được lọc
        $.each(data, function (index, order) {
            var statusColor = getStatusColor(order.status);

            var row = "<tr>" +
                "<td>" + order.idOrder + "</td>" +
                "<td>" + order.idCustomer + "</td>" +
                "<td>" + order.dateCreated + "</td>" +
                "<td>" + order.totalBill + "</td>" +
                "<td style='color: " + statusColor + "'>" + getStatusText(order.status) + "</td>" +
                "<td><button id='edit_btn' type='button' class='btn btn-success' data-toggle='modal' data-target='#addadminprofile' data-status="+order.status+">Cập nhật trạng thái</button></td>" +
                "</tr>";

            $("#dataTable tbody").append(row);
        });
        check()
    }

    function getStatusText(status) {
        // Chuyển đổi mã trạng thái thành văn bản trạng thái tương ứng
        switch (status) {
            case 0:
                return "Đang Xử Lý";
            case 1:
                return "Đang Giao Hàng";
            case 2:
                return "Giao Thành Công";
            case 3:
                return "Hủy Đơn Hàng";
            default:
                return "Unknown Status";
        }
    }

    function getStatusColor(status) {
        // Hàm này có thể được mở rộng để trả về màu sắc dựa trên mã trạng thái
        // Ví dụ: Màu xanh cho "Đang Giao Hàng", màu đỏ cho "Hủy Đơn Hàng", ...
        // Đối với mục đích minh họa, nó sẽ trả về màu đen
        if (status == 2)
            return "blue";
        else if(status ==3)
            return "red";
        else
            return "black";
    }
    function exportToExcel() {
        // Lấy dữ liệu từ bảng HTML
        var table = document.getElementById("dataTable");
        var data = [];
        for (var i = 0; i < table.rows.length; i++) {
            var row = [];
            for (var j = 0; j < table.rows[i].cells.length; j++) {
                row.push(table.rows[i].cells[j].innerText);
            }
            data.push(row);
        }

        // Tạo đối tượng Workbook của SheetJS
        var ws = XLSX.utils.aoa_to_sheet(data);
        var wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, "HoaDon");

        // Xuất file Excel
        XLSX.writeFile(wb, "HoaDon.xlsx");
    }
</script>
<%@include file ="component/footer.jsp" %>