
<%-- 
    Document   : listImport
    Created on : Oct 7, 2023, 7:46:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>


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
                <input type="hidden" name="idImportDetails" id="idImportDetails" >
                <input type="hidden" name="chosenProducts" id="chosenProducts">
                <div class="modal-body">
                    <input type="hidden" name="delete_id" value="">
                    <div class="form-group">                        
                        <label>Nhân viên nhập hàng : ${staff.idStaff} </label> 
                        <input id="idPerson" name="idPerson" type="hidden" value=${staff.idStaff} >
                    </div>
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

                    <div class="form-group">
                        <label>Sản phẩm</label>
                        <div class="container-fluid" style="display: flex; justify-content: space-between; gap: 10px;">
                            <div class="card shadow mb-4"style="max-width: 100%;min-width: 100%;max-height: 200px !important; overflow: auto !important">
                                <div class="card-body" >
                                    <div class="table-responsive table-Cover">
                                        <table id="dataProduct" class="table table-bordered table-ScrollBar" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Id Product</th>
                                                    <th>Name Product</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${dataProduct}" var="c">
                                                    <tr>
                                                        <td> ${c.idProduct}</td>
                                                        <td> ${c.nameProduct}</td>
                                                        <td>${c.price}</td>
                                                        <td><a style="cursor: pointer">Chọn</a></td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Sản phẩm được chọn </label>
                            <div class="card shadow mb-4" style="max-width: 100%;min-width: 100%;max-height: 200px !important; overflow: auto !important">
                                <div class="card-body">
                                    <div class="table-responsive table-Cover">
                                        <table id="datacheckProduct" class="table table-bordered table-ScrollBar"  width="100%" cellspacing="0">

                                            <tr>
                                                <th>IdProduct</th>
                                                <th>NameProduct</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>

                                        </table>
                                    </div>
                                </div>


                            </div>
                            <div class="total" style="text-align: right; color: black; font-weight: bold; height: 50px; font-size: 12pt; margin-top: 20px; margin-right: 50px;">Tổng tiền: <span id="totalprice">0</span></div>
                            <input id="totalBill" type="hidden" name="totalBill" value="0">
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
                                        <button  id="edit_btn" type="button" name="edit_btn" class="btn btn-success"data-toggle="modal" data-target="#addadminprofile"> Sửa </button>
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
            var price = parseFloat(row.cells[2].textContent.trim().replace(/,/g, ''));
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
                totalCell.textContent = total;
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
                priceCell.textContent = formatNumber(price);
                var quantityInput = document.createElement('input');
                quantityInput.type = 'number';
                quantityInput.id = 'quantity_' + idProduct;
                quantityInput.value = 1;
                quantityInput.min = 1;
                quantityCell.appendChild(quantityInput);
                quantityInput.addEventListener('change', function () {
                    var quantity = parseInt(quantityInput.value);
                    if (isNaN(quantity) || quantity <= 0) {
                        quantityInput.value = 1; // Nếu số âm, đặt lại giá trị là 1 hoặc có thể xử lý khác
                        quantity = 1; // Đặt lại biến quantity thành 1 hoặc giá trị mặc định
                    }
                    var total = price * quantity;
                    totalCell.textContent = total;
                    updateTotal(); // Cập nhật tổng khi có thay đổi số lượng sản phẩm
                });

                var deleteButton = document.createElement('a');
                deleteButton.textContent = 'Xóa';
                deleteButton.style.cursor = 'pointer';
                deleteButton.addEventListener('click', function () {
                    deleteRow(newRow);
//                    updateTotal(); // Cập nhật tổng khi xóa sản phẩm
                });
                deleteCell.appendChild(deleteButton);

                var initialQuantity = parseInt(quantityInput.value);
                var initialTotal = price * initialQuantity;
                totalCell.textContent = formatNumber(initialTotal);
            }
            updateTotal();
        }
    });

    // Hàm định dạng số thành chuỗi có dấu phẩy ngăn cách hàng nghìn
function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
    
    // Hàm định dạng số thành chuỗi có dấu phẩy ngăn cách hàng nghìn
function formatCurrency(amount) {
    return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// Tính tổng tiền từ các giá trị trong bảng datacheckProduct
function calculateTotal() {
    let total = 0;
    const datacheckProduct = document.getElementById('datacheckProduct');
    const rows = datacheckProduct.getElementsByTagName('tr');
    if (rows.length <= 1) {
        const totalSpan = document.getElementById('totalprice');
        totalSpan.textContent = '0';
        total = 0;
    } else {
        for (let i = 1; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName('td');
            if (cells.length >= 5) {
                const price = parseFloat(cells[2].textContent.trim().replace(/,/g, ''));
                const quantity = parseInt(cells[3].querySelector('input[type="number"]').value);
                const rowTotal = price * quantity;
                total += rowTotal;
                // Cập nhật lại giá trị trong cột total với định dạng số
                cells[4].textContent = formatNumber(rowTotal);
            }
        }
    }
    return total;
}

// Cập nhật tổng tiền khi có thay đổi trong bảng datacheckProduct
function updateTotal() {
    const totalSpan = document.getElementById('totalprice');
    const totalPrice = calculateTotal();
    totalSpan.textContent = formatNumber(totalPrice);
    // Cập nhật giá trị totalBill trong form
    const totalBillInput = document.getElementById('totalBill');
    if (totalBillInput) {
        totalBillInput.value = formatNumber(totalPrice);
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
                    var price = row.cells[2].textContent.trim();
                    var total = row.cells[4].textContent.trim();
                    var quantityInput = row.cells[3].querySelector('input[type="number"]');

                    if (quantityInput) {
                        var quantity = parseInt(quantityInput.value || 0);
                        productList.push({
                            idProduct: idProduct,
                            price: price,
                            quantity: quantity,
                            total: total
                        });
                    }
                }
            });

            let listProductString = JSON.stringify(productList);
            alert("list product" + listProductString);
            document.getElementById("chosenProducts").value = listProductString;
//            window.location.href = "/J2EE_Project_Admin/Import";
        });
    });
    const existingContent = new Set();

    let defaultAction = 'add-Import';

    var clickButtonEdit = false;
//    update-import
    //Cập nhật
    document.addEventListener('click', function (e) {
        if (e.target && e.target.id === 'edit_btn') {

            let form = document.getElementById('ImportForm');
            
            form.action = 'update-Import';
            clearForm();
            clickButtonEdit = true;
            // Lấy giá trị từ hàng tương ứng
            let row = e.target.closest('tr');
            const idImport = row.cells[0].textContent.trim(); // Thay thế 0 bằng vị trí cột ID
            const idSupplier = row.cells[1].textContent.trim(); // Thay thế 1 bằng vị trí cột ID Supplier
            const dateCreated = row.cells[2].textContent.trim(); // Thay thế 2 bằng vị trí cột Date Created
            const totalbill = row.cells[3].textContent.trim();
            // Điền các giá trị vào form
            document.getElementById('idImport').value = idImport;
            document.querySelector('select[name="idSupplier"]').value = idSupplier;
            document.getElementById('dateCreated').value = dateCreated;
            document.getElementById('totalBill').value = totalbill;
//            ajax 
            $.ajax({
                url: "/J2EE_Project_Admin/load_datacheckproduct",
                type: "POST",
                data: {
                    idImport: idImport
                },
                dataType: "json",
                success: function (response) {
                    var importDetails = response.dataImportdetails;
                    var dataProduct = response.dataProduct;
                    if (importDetails && dataProduct && Array.isArray(importDetails) && Array.isArray(dataProduct)) {
                        updateProductDetails(importDetails, dataProduct);
                    } else {
                        console.error("Dữ liệu không tồn tại hoặc không đầy đủ!");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi phân tích JSON:", error);
                }
            });
            existingContent.clear();
        } else if (e.target && e.target.id === 'exit-btn') {
            let form = document.getElementById('ImportForm');
            form.action = defaultAction;
        }
    });
    document.addEventListener('click', function (e) {
        // Kiểm tra xem phần tử được click có thuộc modal không
        let isModalClick = isDescendant(document.getElementById('addadminprofile'), e.target);
        if ((isModalClick === false && clickButtonEdit === false)) {
            let form = document.getElementById('ImportForm');
            // Khôi phục giá trị mặc định của action khi click ra ngoài modal
            form.action = defaultAction;
        }

        clickButtonEdit = false;

    });


    function updateProductDetails(importDetails, dataProduct) {
        var datacheckProduct = document.getElementById('datacheckProduct');
        importDetails.forEach(function (importDetail) {
            var existingProduct = dataProduct.find(function (product) {
                return product.idProduct === importDetail.idProduct;
            });
            if (existingProduct) {
                var newRow = datacheckProduct.insertRow();
                newRow.innerHTML = '<td>' + importDetail.idProduct + '</td>' +
                        '<td>' + existingProduct.nameProduct + '</td>' +
                        '<td>' + existingProduct.price + '</td>' +
                        '<td><input type="number" value="' + importDetail.quantity + '" min="1" /></td>' +
                        '<td>' + importDetail.price * importDetail.quantity + '</td>';
                var deleteCell = newRow.insertCell(5);
                var deleteButton = document.createElement('a');
                deleteButton.textContent = 'Xóa';
                deleteButton.style.cursor = 'pointer';
                deleteButton.addEventListener('click', function () {
                    deleteRow(newRow);
                });
                deleteCell.appendChild(deleteButton);

                var quantityInput = newRow.querySelector('input[type="number"]');
                quantityInput.addEventListener('change', function () {
                    var quantity = parseInt(quantityInput.value);
                    if (isNaN(quantity) || quantity <= 0) {
                        quantityInput.value = 1; // Nếu số âm, đặt lại giá trị là 1 hoặc có thể xử lý khác
                        quantity = 1; // Đặt lại biến quantity thành 1 hoặc giá trị mặc định
                    }
                    var total = existingProduct.price * quantity;
                    newRow.cells[4].textContent = total;
                    updateTotal();
                });
            }
        });
        updateTotal();
    }
    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }


    function isDescendant(parent, child) {
        let node = child.parentNode;

        while (node !== null) {
            if (node === parent) {
                return true;
            }
            node = node.parentNode;
        }

        return false;
    }
    
    function clearForm() {
        // Xóa trắng các trường input trong form
        document.getElementById('idImport').value = '';
        document.querySelector('select[name="idSupplier"]').value = '';
        document.getElementById('dateCreated').value = '';
        document.getElementById('totalBill').value = '0';

        // Xóa bảng datacheckProduct
        var datacheckProduct = document.getElementById('datacheckProduct');
        datacheckProduct.innerHTML = '<tr>' +
                '<th>IdProduct</th>' +
                '<th>NameProduct</th>' +
                '<th>Price</th>' +
                '<th>Quantity</th>' +
                '<th>Total</th>' +
                '</tr>';

        // Cập nhật tổng tiền về 0
        updateTotal();
    }

</script>
<%@include file ="component/footer.jsp" %>