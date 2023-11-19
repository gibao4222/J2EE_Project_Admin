<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanh lọc sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showHideFields() {
            var filterOption = document.getElementById("filterOption").value;
            var rangeAField = document.getElementById("rangeAField");
            var rangeBField = document.getElementById("rangeBField");
            
            if (filterOption === "less_than_a" || filterOption === "greater_than_a") {
                rangeAField.style.display = "block";
                rangeBField.style.display = "none";
            } else if (filterOption === "range_a_b") {
                rangeAField.style.display = "block";
                rangeBField.style.display = "block";
            } else {
                rangeAField.style.display = "none";
                rangeBField.style.display = "none";
            }
        }
    </script>
    <style>
        .mt-4 {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Thanh lọc sản phẩm</h2>
        
        <form action="/filter" method="GET">
            <div class="form-group">
                <label for="filterOption">Lọc theo:</label>
                <select class="form-control" id="filterOption" name="filterOption" onchange="showHideFields()">
                    <option value="low_to_high">Giá thấp nhất</option>
                    <option value="high_to_low">Giá cao nhất</option>
                    <option value="less_than_a">Bé hơn a</option>
                    <option value="greater_than_a">Lớn hơn a</option>
                    <option value="range_a_b">Từ a đến b</option>
                </select>
            </div>
            
            <div class="form-group" id="rangeAField" style="display: none;">
                <label for="rangeA">a:</label>
                <input type="text" class="form-control" id="rangeA" name="rangeA">
            </div>
            
            <div class="form-group" id="rangeBField" style="display: none;">
                <label for="rangeB">b:</label>
                <input type="text" class="form-control" id="rangeB" name="rangeB">
            </div>
            
            <button type="submit" class="btn btn-primary">Lọc</button>
        </form>
    </div>
</body>
</html>