<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 10:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<style>
    body{
        background: url("https://c4.wallpaperflare.com/wallpaper/669/1008/1018/blue-archive-anime-girls-koharu-blue-archive-hanako-blue-archive-hd-wallpaper-preview.jpg") no-repeat fixed;
        background-size: 100% 100% ;
        font-family: "Arial", sans-serif;


    }
    .search{
        padding-left: 45%;
        width: 100%;
        display: inline-flex;
        justify-content: space-between;
    }
    .label input{
        border-radius: 20px;
        height: 40px;
        float: left;
    }
    .button{
        font-size: 18px;
        float: right;
    }
    .main{
        background: rgba(0, 0, 0, 0.5);
        width: 100%;
        height: 1800px;
        text-align: center;

    }
    .table{
        background: rgba(0, 0, 0, 0.5);
        color: white;
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
        padding: 30px;
        text-align: center;
        font-family: "Arial", serif;
    }
</style>
<header>
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
    <div id="head-link" style="padding-top: 10px;background: rgba(255,255,255,0.87);border-radius: 15px">
        <ul style="list-style: none;display: inline-flex;justify-content: space-between">
            <li ><a href="sales?action=check" style="text-decoration: none;padding-left: 30px;color: #000000"><i class="bi bi-bag"></i><c:if test="${sessionScope['count'] != null}"><span style="font-size: 15px;background-color: red;color: white;border-radius:30px;width: 30px;height: 30px">${sessionScope['count']}</span></c:if>  <b style="padding-left: 10px">Giỏ hàng</b></a> </li>
            <li ><a href="sales" style="text-decoration: none;padding-left: 30px;color: #000000"><i class="bi bi-house"></i><b style="padding-left: 10px">Trang chủ</b></a> </li>
        </ul>
    </div>
</header>
<body>
<div class="search">
    <form method="post">
    <div class="label"><input type="text" name="name" placeholder="input name product here" width="300px"></div>
   <i class="bi bi-search"><input type="submit" value="search" style="border-radius: 20px"></i>
    </form>
</div>
<div class="main">
    <table class="table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>House Product</th>
            <th>Prize</th>
            <th>Wikipedia for more</th>
        </tr>
        <c:forEach var="item" items="${requestScope['list']}">
            <tr>
                <td>${item.getId()}</td>
                <td>${item.getName()}</td>
                <td>${item.getHouseProduce()}</td>
                <td>${item.getPrize()}</td>
                <td><a href="${item.getNote()}">Link</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
