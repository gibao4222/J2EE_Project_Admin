<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1em;
            width: 100%;
        }

        nav {
            background-color: #555;
            color: #fff;
            padding: 20px;
            width: 200px;
        }

        nav a {
            display: block;
            color: #fff;
            text-align: left;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #ddd;
            color: #333;
        }

        .content {
            padding: 20px;
        }

        .material-options {
            display: flex;
            justify-content: space-around;
        }

        .material-option {
            border: 2px solid #333;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .material-option:hover {
            background-color: #ddd;
        }
    </style>
    <title>Ch?n Ch?t Li?u</title>
</head>
<body>

    <header>
        <h1>Trang Ch?n Ch?t Li?u</h1>
    </header>

    <nav>
        <a href="#">Trang Ch?</a>
        <a href="#">G?</a>
        <a href="#">Nh?a</a>
        <a href="#">Kim Lo?i</a>
        <a href="#">Nhôm</a>
        <a href="#">Cao Su</a>
    </nav>

    <div class="content">
        <h2>Ch?n Ch?t Li?u:</h2>
        <div class="material-options">
            <div class="material-option" onclick="selectMaterial('go')">G?</div>
            <div class="material-option" onclick="selectMaterial('nhua')">Nh?a</div>
            <div class="material-option" onclick="selectMaterial('kimloai')">Kim Lo?i</div>
            <div class="material-option" onclick="selectMaterial('nhom')">Nhôm</div>
            <div class="material-option" onclick="selectMaterial('caosu')">Cao Su</div>
        </div>
    </div>

    <script>
        function selectMaterial(material) {
            alert("B?n ?ã ch?n ch?t li?u: " + material);
            // Th?c hi?n các hành ??ng khác tùy thu?c vào ch?t li?u ???c ch?n
        }
    </script>

</body>
</html>
