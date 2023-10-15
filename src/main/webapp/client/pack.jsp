<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 12:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<style>
    body{
        background: url("https://images2.alphacoders.com/132/1325367.jpg") no-repeat fixed;
        background-size: 100% 100% ;
        font-family: "Arial", sans-serif;
        width: 100%;
        height: 1800px;
    }
    ul{
        list-style: none;
        text-align: center;
    }
    li {

        display: inline-block;
        padding: 14px 16px;
    }
    .table{
        background: rgba(0, 0, 0, 0.5);
        color: white;
    }
    .footer {
        background: rgba(0, 0, 0, 0.5);
        padding: 20px;
        text-align: center;
        color: #ffffff;
    }
    #head {
        width: 100%;
        overflow: auto;
    }

    .logo {
        width: 30%;
        float: left;
        box-sizing: border-box;
        padding: 30px;
    }

    .banner {
        width: 70%;
        float: right;
        box-sizing: border-box;
        padding: 40px;
    }

    #head-link {
        /*padding: 30px;*/
        text-align: center;
        font-family: "Arial", serif;
    }
    header{
    }
</style>
<header>
    <c:if test="${requestScope['messageBuy'] != null}">
        <%
            PrintWriter printWriter = response.getWriter();
            printWriter.println("<script type=\"text/javascript\">");
            printWriter.println("alert('Mua thành công');");
            printWriter.println("</script>");
        %>
    </c:if>
    <div id="head">
        <div class="logo">
            <img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/Blue_Archive_EN_logo.svg">
        </div>
        <div class="banner">
            <div style="float: right">
                <a href="login?action=logout&username=${sessionScope["username"]}" style="text-decoration: none"><i class="bi bi-box-arrow-left"></i></a>
            </div>

            <h1 style="font-size: 50px"><b>Sensei! Welcome to Kivotos!</b></h1>
        </div>
    </div>
    <br>
    <div id="head-link" style="padding-top: 10px;border-radius: 15px; background: rgb(252,252,252);">
        <ul style="list-style: none;display: inline-flex;justify-content: space-between">
            <li ><a href="sales" style="text-decoration: none;padding-left: 30px;color: #000000"><i class="bi bi-house"></i><b style="padding-left: 10px">Trang chủ</b></a> </li>
            <li><a href="sales?action=search" style="text-decoration: none;padding-left: 30px;color: #000000"><i class="bi bi-search"></i><b>Tìm kiếm</b></a></li>
        </ul>
    </div>
</header>
<body>

<form method="post">
    <div style="width: 100%;height: 1800px;  background: rgba(0, 0, 0, 0.5);">
<table class="table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>houseProduce</th>
        <th>prize</th>
        <th>status</th>
        <th>urlImg</th>
        <th>note</th>
        <th>Active</th>
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
            <td><a href="sales?action=deletePack&id=${stuff.id}"><i class="bi bi-trash3"></i></a> </td>
            <td><a href="sales?action=BuyPack&id=${stuff.id}"><i class="bi bi-bag"></i></a> </td>
        </tr>

    </c:forEach>
</table>
</div>
</form>
<audio autoplay>
    <source src="/music/background/y2meta.com%20-%20ブルーアーカイブ%20Blue%20Archive%20OST%2059.%20RE%20Aoharu%20(320%20kbps).mp3" type="audio/mpeg">
</audio>

</body>
<footer class="footer">
    <p>Số điện thoại: 0123456789</p>
    <p>Địa chỉ: Đường ABC, Quận XYZ, Thành phố ABC</p>
    <p>Email: example@example.com</p>
    <p>
        <a href="https://www.facebook.com">Facebook</a>
    </p>
</footer>
</html>
