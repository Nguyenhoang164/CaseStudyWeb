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
    <title>Thêm mặt hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: rgb(255, 255, 255,0.5);
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
            border: 1px solid #ccc;
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
        body{
            background: url("https://e1.pxfuel.com/desktop-wallpaper/102/619/desktop-wallpaper-blue-archive-shiroko-sunaookami.jpg") no-repeat fixed;
            background-size: 100% 100% ;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Thêm mặt hàng</h2>

    <form method="post">
        <div class="form-group">
            <label for="name">Tên mặt hàng:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="houseProduce">Nhà sản xuất:</label>
            <input type="text" id="houseProduce" name="houseProduce" required>
        </div>
        <div class="form-group">
            <label for="prize">Giá:</label>
            <input type="text" id="prize" name="prize" required>
        </div>
        <div class="form-group">
            <label for="status">Trạng thái:</label>
            <input type="text" id="status" name="status" required>
        </div>
        <div class="form-group">
            <label for="urlImg">URL hình ảnh:</label>
            <input type="text" id="urlImg" name="urlImg" required>
        </div>
        <div class="form-group">
            <label for="note">Ghi chú:</label>
            <textarea id="note" name="note"></textarea>
        </div>
        <div class="form-group">
            <button type="submit" value="add">Thêm</button>

        </div>
        <c:if test="${requestScope['message'] != null}">
            <span>${requestScope['message']}</span>
        </c:if>
    </form>
    <a href="sales?action=back" style="text-decoration: none">Back</a>
</div>
<audio autoplay>
    <source src="/music/background/Blue%20Archive%20OST%2015.%20Honey%20Jam.mp4" type="audio/mpeg">
</audio>
</body>
</html>