<%-- 
    Document   : editAdmin
    Created on : Nov 14, 2023, 9:01:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file ="component/navbar.jsp" %>
 <style>
        /* Để có kích thước hợp lý cho logo */
        .bank-logo {
            height: 24px;
            width: 24px;
            max-width: 24px;
            max-height: 24px;
            vertical-align: middle;
            margin-right: 5px;
        }
    </style>
    
<div class="container-fluid">

<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Thông Tin Admin
            
    </h6>
  </div>

  <div class="card-body">
    <form action="" method="POST">

       

            <div class="form-group">
                <label> Tên Người Dùng </label>
                <input type="name" name="fullName" class="form-control" value="${staff.fullName}">
            </div>
             <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="${staff.email}">
            </div>

            <!-- <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<?php echo $result['admin_Email'] ?>">
            </div> -->
            <div class="form-group">
                <label>Mật Khẩu</label>
                <input type="password" name="changepassword" class="form-control" placeholder="Enter New Password">
            </div>
            <div class="form-group">
                <label>Địa chỉ</label>
                <input type="text" name="address" class="form-control" value="${staff.address}">
            </div>
            <div class="form-group">
                <label>Số điện thoại</label>
                <input type="phone" name="numberPhone" class="form-control" value="${staff.numberPhone}">
            </div>
            <div class="form-group">
                <label>Ngân hàng</label>
                <input type="text" name="name" class="form-control" value="${staff.bankAccount}">
            </div>
            <div class="form-group">
                <select id="bankSelect" class="form-control">
                
                </select>
            </div>
            
            <div class="form-group">
                <label>Số Tài Khoản</label>
                <input type="text" name="accountNumber" id="accountNumber" class="form-control" value="${staff.accountNumber}">
            </div>

        <div class="modal-footer">
            <button onclick="location.href='staff'" type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" name="save" class="btn btn-primary">Lưu</button>
        </div>
      </form>

  </div>
</div>

</div>
<!-- /.container-fluid -->

<script>
    const apiURL = "https://api.vietqr.io/v2/banks";
    
    const bankSelect = document.getElementById("bankSelect");
    
    
     const accountNumberInput = document.getElementById("accountNumber");
     accountNumberInput.addEventListener("input", function () {
        // Kiểm tra số tài khoản
        checkAccount();
    });
    function checkAccount(){
        const selectedBankCode = bankSelect.value;
        alert(selectedBankCode);
        const accountNumber = accountNumberInput.value;
        
        if(selectedBankCode && accountNumber){
            const lookupApiURL = "https://api.vietqr.io/v2/lookup";
            const requestData = JSON.stringify({
                "bin": selectedBankCode,
                "accountNumber": accountNumber
            });
            const config = {
                method: 'post',
                url: lookupApiURL,
                headers:{
                 'x-client-id': 'd38a07a9-c38a-4de1-a309-0333a98036e2',
                    'x-api-key': 'b9bbda52-51d8-48de-b0e0-bdadbc3d9240',
                    'Content-Type': 'application/json'
                },
                data: requestData
            };
            // Gửi yêu cầu kiểm tra số tài khoản
            fetch(lookupApiURL, config)
                .then(response => response.json())
                .then(data => {
                    // Xử lý kết quả, có thể hiển thị thông báo cho người dùng
                    console.log(data);
                })
                .catch(error => console.error('Error checking account:', error));
        }
    }
    fetch(apiURL)
            .then(response => response.json())
            .then(data=>{
                data.data.forEach(bank =>{
                    const option = document.createElement('option');
                    option.value = bank.code;
                    option.text = bank.name+' ('+bank.shortName+')';
                    
                    const logoImg = document.createElement('img');
                    logoImg.src = bank.logo;
                    logoImg.alt = 'Logo ${bank.name}';
                    logoImg.classList.add('bank-logo');
                    
                    option.prepend(logoImg);
                    
                    bankSelect.appendChild(option);
                });
    })
    .catch(error => console.error('Error fetching data:', error));
    
</script>
<%@include file="component/footer.jsp" %>
