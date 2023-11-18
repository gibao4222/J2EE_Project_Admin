
<%-- 
    Document   : listImport
    Created on : Oct 7, 2023, 7:46:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>
<%@ page import="DAL.ImportDAL" %>
<%@ page import="Model.ImportModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>



<div class="modal fade" id="addadminprofile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="min-width: 750px" role="document">
        <div class="modal-content" style="width: 750px; align-content: center">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Nhập hàng </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id= "ImportForm" action="add-Import" method="POST">
                <input type="hidden" name="idImport" id="idImport" >
                <input type="hidden" name="chosenProducts" id="chosenProducts">
                <div class="modal-body">
                    <input type="hidden" name="delete_id" value="">
                    <div class="form-group">
                        <label> ID Supplier </label>
                        <!--<input id="idSupplier" type="text" name="idSupplier" required class="form-control" placeholder="Enter ID">-->
                        <select name="idSupplier" class="form-control">
                            <option value="" selected disabled>Chọn Nhà Cung Cấp</option>
                            <c:forEach items="${datasuppliers}" var="c">
                                <option value="${c.idSupplier}">${c.idSupplier}</option>
                            </c:forEach>
                        </select>
                    </div>            
                    <div class="form-group">
                        <label>Date Created</label>
                        <input id="dateCreated" type="date" name="dateCreated" class="form-control" placeholder="Enter Date">
                    </div>
                    <!--                    <div class="form-group">
                                            <label> Total Bill</label>
                                            <input id="totalBill" type="text" name="totalBill" class="form-control" value="" placeholder="Enter Total">
                                        </div>-->
                    <div class="form-group">                                            
                        <div id="containercart">
                            <h6>Danh sách sản phẩm</h6>
                            <table id="dataProduct" class="scrollable-table">
                                <!--<table class="table table-bordered table-ScrollBar" id="dataTable" width="100%" cellspacing="0">-->
                                <!--<thead>-->
                                <tr>
                                    <th>Id Product</th>
                                    <th>Name Product</th>
                                    <th>Price</th>
                                </tr>
                                <!--</thead>-->
                                <!--<tbody>-->
                                <c:forEach items="${dataProduct}" var="c">
                                    <tr>
                                        <td> ${c.idProduct}</td>
                                        <td> ${c.nameProduct}</td>
                                        <td>${c.price}</td>
                                        <td><a>Chọn</a></td>

                                    </tr>
                                </c:forEach>

                                <!--</tbody>-->
                                <!--</table>-->
                            </table>
                            <h6>Sản phẩm cần nhập</h6>
                            <table id="datacheckProduct" class="scrollable-table">
                                <tr>
                                    <th>IdProduct</th>
                                    <th>NameProduct</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>

                            </table>
                            <div class="total">Tổng tiền: <span id="totalprice">0</span></div>
                            <input id="totalBill" type="hidden" name="totalBill" value="0">

                            <!--<button onclick="deletecartall()">Xóa tất cả</button>-->                                   
                        </div>

                    </div>


                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" name="registerbtn" id="btn-Save"class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </div>
</div>

<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Nhập Hàng
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addadminprofile">
                    Nhập Hàng
                </button>
            </h6>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th>ID SUPPLIER </th>
                            <th>Date Created</th>
                            <th>Total Bill</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${dataImport}" var="ip">
                            <tr>
                                <td>${ip.idImport}</td>
                                <td>${ip.idSupplier}</td>
                                <td>${ip.dateCreated}</td>
                                <td>${ip.totalBill}</td>
                                <td>
                                    <form action="" method="post">
                                        <!--<input type="hidden" name="edit_user" value="<?php echo $result['admin_User']; ?>">-->
                                        <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile" > Sửa </button>
                                        <!--<a href="editStaff.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">EDIT</a>--> 
                                    </form>
                                </td>
                                <td>
                                    <form action="delete-Import" method="post">
                                        <input type="hidden" name="idImport" value="${ip.idImport}">
                                        <button type="submit" name="delete_btn" class="btn btn-danger"> Xóa </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <!--          <tr>
                                  
                                    
                                  </tr>-->
                    </tbody>
                </table>

            </div>
        </div>
    </div>

</div>
<script>
    document.getElementById('dataProduct').addEventListener('click', function (event) {
        if (event.target.tagName === 'A') {
            var row = event.target.parentElement.parentElement;
            // Lấy giá trị từ các ô trong hàng
            var idProduct = row.cells[0].textContent.trim();
            var nameProduct = row.cells[1].textContent.trim();
            var price = parseFloat(row.cells[2].textContent.trim());
            var datacheckProduct = document.getElementById('datacheckProduct');
            var newRow = datacheckProduct.insertRow();
            var existingRow = null;
            Array.from(datacheckProduct.rows).forEach(function (checkRow) {
                if (checkRow.cells.length >= 1) {
                    var checkIdProduct = checkRow.cells[0].textContent.trim();
                    if (checkIdProduct === idProduct) {
                        existingRow = checkRow;
                    }
                }
            });
            if (existingRow) {
                var quantityInput = existingRow.cells[3].querySelector('input[type="number"]');
                quantityInput.value = parseInt(quantityInput.value) + 1;
                var quantity = parseInt(quantityInput.value);
                var totalCell = existingRow.cells[4];
                var total = price * quantity;
                totalCell.textContent = total.toFixed(2);
            } else {
                var newRow = datacheckProduct.insertRow();
                var idCell = newRow.insertCell(0);
                var nameCell = newRow.insertCell(1);
                var priceCell = newRow.insertCell(2);
                var quantityCell = newRow.insertCell(3);
                var totalCell = newRow.insertCell(4);
                var deleteCell = newRow.insertCell(5);
                idCell.textContent = idProduct;
                nameCell.textContent = nameProduct;
                priceCell.textContent = price;
                var quantityInput = document.createElement('input');
                quantityInput.type = 'number';
                quantityInput.id = 'quantity_' + idProduct;
                quantityInput.value = 1;
                quantityInput.min = 1;
                quantityCell.appendChild(quantityInput);
                quantityInput.addEventListener('change', function () {
                    var quantity = parseInt(quantityInput.value);
                    var total = price * quantity;
                    totalCell.textContent = total.toFixed(2);
                    updateTotal(); // Cập nhật tổng khi có thay đổi số lượng sản phẩm
                });

                var deleteButton = document.createElement('a');
                deleteButton.textContent = 'Xóa';
                deleteButton.addEventListener('click', function () {
                    deleteRow(newRow);
//                    updateTotal(); // Cập nhật tổng khi xóa sản phẩm
                });
                deleteCell.appendChild(deleteButton);

                var initialQuantity = parseInt(quantityInput.value);
                var initialTotal = price * initialQuantity;
                totalCell.textContent = initialTotal.toFixed(2);
            }
            updateTotal(); // Cập nhật tổng khi thêm sản phẩm mới
        }
    });

    // Tính tổng tiền từ các giá trị trong bảng datacheckProduct
    function calculateTotal() {
        let total = 0;
        const datacheckProduct = document.getElementById('datacheckProduct');
        const rows = datacheckProduct.getElementsByTagName('tr');
        if (rows.length <= 1) {
            const totalSpan = document.getElementById('totalprice');
            totalSpan.textContent = '0';
            total = 0;
        } else
            for (let i = 1; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName('td');
                if (cells.length >= 5) {
                    const price = parseFloat(cells[2].textContent.trim());
                    const quantity = parseInt(cells[3].querySelector('input[type="number"]').value);
                    const rowTotal = price * quantity;
                    total += rowTotal;
                }

            }
        return total.toFixed(2);
    }

// Cập nhật tổng tiền khi có thay đổi trong bảng datacheckProduct
    function updateTotal() {
        const totalSpan = document.getElementById('totalprice');
        const totalPrice = calculateTotal();
        totalSpan.textContent = totalPrice;
        // Cập nhật giá trị totalBill trong form
        const totalBillInput = document.getElementById('totalBill');
        if (totalBillInput) {
            totalBillInput.value = totalPrice;
        }
    }


// Gọi hàm updateTotal khi xóa sản phẩm
    function deleteRow(row) {
        row.parentElement.removeChild(row);
        updateTotal();
    }
    document.addEventListener('DOMContentLoaded', function () {
        const btnSave = document.getElementById('btn-Save');
        btnSave.addEventListener('click', function () {
            let selectedRows = document.querySelectorAll('#datacheckProduct tbody tr');
            let productList = [];
            selectedRows.forEach(function (row) {
                // Kiểm tra xem row.cells[0] có tồn tại không
                if (row.cells.length > 0) {
                    var idProduct = row.cells[0].textContent.trim();
                    var price = parseFloat(row.cells[2].textContent.trim());

                    var quantityInput = row.cells[3].querySelector('input[type="number"]');

                    if (quantityInput) {
                        var quantity = parseInt(quantityInput.value || 0);
                        productList.push({
                            idProduct: idProduct,
                            price: price,
                            quantity: quantity
                        });
                    }
                }
            });

            let listProductString = JSON.stringify(productList);
            console.log("list product" + listProductString);

            document.getElementById("chosenProducts").value = listProductString;
        });
    });
//    update-import
    //Cập nhật
    document.addEventListener('click', function (e) {
        if (e.target && e.target.id === 'edit_btn') {

            let form = document.getElementById('ImportForm');
            form.action = 'update-Import';
            
            // Lấy giá trị từ hàng tương ứng
             let row = e.target.closest('tr');
            const idImport = row.cells[0].textContent.trim(); // Thay thế 0 bằng vị trí cột ID
            const idSupplier = row.cells[1].textContent.trim(); // Thay thế 1 bằng vị trí cột ID Supplier
            const dateCreated = row.cells[2].textContent.trim(); // Thay thế 2 bằng vị trí cột Date Created

            // Điền các giá trị vào form
            document.getElementById('idImport').value = idImport;
            document.querySelector('select[name="idSupplier"]').value = idSupplier;
            document.getElementById('dateCreated').value = dateCreated;
        }
    });

</script>
<style>
    #containercart{
        margin: 30px auto;
        height: auto;
        width: 90%;
        border: 2px solid #000;
        padding: 20px;
    }
    #containercart h6{
        text-align: center;
    }
    #containercart #dataProduct{
        display: block;
    }
    #containercart #dataProduct{
        border-spacing: 0;
        width: 100%;
    }
    #containercart #dataProduct th, td{
        width: 200px;
        text-align: center;
        /*border-bottom: 1px solid #000;*/
        padding: 10px;
        vertical-align: middle;
    }

    #containercart #datacheckProduct{
        border-spacing: 0;
        width: 100%;
    }
    #containercart #datacheckProduct th, td{
        width: 150px;
        text-align: center;
        /*border-bottom: 1px solid #000;*/
        padding: 10px;
        vertical-align: middle;
    }
    #containercart #datacheckProduct td button{
        height: auto;
        width: 30px;
        line-height: 25px;
        font-size: 15pt;
        text-align: center;
        border: 2px solid #000;
        background: none;
        cursor: pointer;
        outline: none;
    }
    #containercart #datacheckProduct td button:active{
        border: 2px solid rgb(221, 18, 18);
        color: rgb(221, 18, 18);
    }
    #containercart #datacheckProduct td input{
        height: 25px;
        width: 50px;
        font-size: 12pt;
        text-align: center;
        /*border-left: none;*/
        /*border-right: none;*/
        background: none;
    }
    #containercart .total{
        text-align: right;
        color: black;
        font-weight: bold;
        height: 50px;
        font-size: 12pt;
        margin-top: 20px;
    }
    #quantityInput {
        border: none; /* Loại bỏ viền */
        /* Các thuộc tính CSS khác cho ô input nếu cần */
    }
    .scrollable-table {
        max-height: calc(5 * 30px); /* 30px là chiều cao ước lượng của mỗi hàng */
        overflow-y: auto; /* Hiển thị thanh cuộn dọc khi vượt quá chiều cao */
        display: block; /* Để xác định chiều cao cụ thể cho từng hàng */
    }
</style>
<%@include file ="component/footer.jsp" %>