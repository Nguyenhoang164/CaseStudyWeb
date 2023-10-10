<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 12:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa thông tin mặt hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("https://e1.pxfuel.com/desktop-wallpaper/102/619/desktop-wallpaper-blue-archive-shiroko-sunaookami.jpg") no-repeat fixed;
            background-size: 100% 100% ;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 5px;
            border-radius: 3px;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Sửa thông tin mặt hàng</h2>
    <form method="post">
        <div class="form-group">
            <label for="id">ID mặt hàng:</label>
            <input type="text" id="id" name="id"  placeholder= "ID mặt hàng hiện tại" required>
        </div>
        <div class="form-group">
            <label for="name">Tên mặt hàng:</label>
            <input type="text" id="name" name="name" placeholder="Tên mặt hàng hiện tại" required>
        </div>
        <div class="form-group">
            <label for="houseProduce">Nhà sản xuất:</label>
            <input type="text" id="houseProduce" name="houseProduce" placeholder="Nhà sản xuất hiện tại" required>
        </div>
        <div class="form-group">
            <label for="prize">Giá:</label>
            <input type="text" id="prize" name="prize" placeholder="Giá hiện tại" required>
        </div>
        <div class="form-group">
            <label for="status">Trạng thái:</label>
            <input type="text" id="status" name="status" placeholder="Trạng thái hiện tại" required>
        </div>
        <div class="form-group">
            <label for="urlImg">URL hình ảnh:</label>
            <input type="text" id="urlImg" name="urlImg" placeholder="URL hình ảnh hiện tại" required>
        </div>
        <div class="form-group">
            <label for="note">Ghi chú:</label>
            <textarea id="note" name="note">Ghi chú hiện tại</textarea>
        </div>
        <div class="form-group">
            <button type="submit" value="update">Lưu</button>
            <a href="sales" style="text-decoration: none">Back</a>
        </div>
        <c:if test="${requestScope['message'] != null}">
            <span>${requestScope['message']}</span>
        </c:if>
    </form>
</div>
<audio autoplay>
    <source src="/music/background/y2meta.com%20-%20ブルーアーカイブ%20Blue%20Archive%20OST%2059.%20RE%20Aoharu%20(320%20kbps).mp3" type="audio/mpeg">
</audio>
</body>
</html>
