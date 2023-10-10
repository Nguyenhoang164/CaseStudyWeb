<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 12:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<style>
    body{
        background: url("https://e1.pxfuel.com/desktop-wallpaper/102/619/desktop-wallpaper-blue-archive-shiroko-sunaookami.jpg") no-repeat fixed;
        background-size: 100% 100% ;
        font-family: "Arial", sans-serif;
    }
    ul{
        list-style: none;
        text-align: center;
    }
    li {

        display: inline-block;
        padding: 14px 16px;
    }
</style>
<body>
<h1 style="text-align: center">Trang web bán hàng</h1>
<ul>
    <li><a href="sales">Trang chủ</a></li>
    <li><a href="#">Sản phẩm</a></li>
    <li><a href="#">Liên hệ</a></li>
</ul>
<table class="table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>houseProduce</th>
        <th>prize</th>
        <th>status</th>
        <th>urlImg</th>
        <th>note</th>
    </tr>
    <c:forEach var="stuff" items="${sessionScope['list']}">
        <tr>
            <td>${stuff.id}</td>
            <td>${stuff.name}</td>
            <td>${stuff.houseProduce}</td>
            <td>${stuff.prize} <img src="https://files.cults3d.com/uploaders/19685247/illustration-file/b23a78c1-14ed-435d-92b1-1eb38e7712a6/1658060193.png" style="width:20px;height: 30px"></td>
            <td>${stuff.status}</td>
            <td><img src="${stuff.urlImg}" style="width: 50px;height: 50px"></td>
            <td>${stuff.note}</td>
        </tr>
    </c:forEach>
</table>
<audio autoplay>
    <source src="/music/background/y2meta.com%20-%20ブルーアーカイブ%20Blue%20Archive%20OST%2059.%20RE%20Aoharu%20(320%20kbps).mp3" type="audio/mpeg">
</audio>
</body>
</html>
