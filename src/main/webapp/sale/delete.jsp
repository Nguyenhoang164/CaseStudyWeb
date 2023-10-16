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
    <title>Xóa đối tượng mặt hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4 url("https://w.wallha.com/ws/14/cQpzb5XA.png") no-repeat fixed;
            background-size: 100% 100% ;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #f44336;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Xóa đối tượng</h2>
    <form method="post">
        <div class="form-group">
            <label for="id">ID đối tượng:</label>
            <input type="number" id="id" name="id" placeholder="Nhập ID đối tượng cần xóa" required>
        </div>
        <div class="form-group">
            <button type="submit" value="delete">Xóa</button>
            <a href="sales?action=back" style="text-decoration: none">Back</a>
        </div>
    </form>
    <c:if test="${requestScope['message'] != null}">
        <span>${requestScope['message']}</span>
    </c:if>
</div>
<audio autoplay>
    <source src="/music/background/Blue%20Archive%20OST%2015.%20Honey%20Jam.mp4" type="audio/mpeg">
</audio>
</body>
</html>