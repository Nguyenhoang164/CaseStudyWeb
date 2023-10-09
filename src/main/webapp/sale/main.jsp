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
    <title>Trang web bán hàng</title>
    <style>
        #head {
            width: 100%;
            overflow: auto;
        }

        .logo {
            width: 10%;
            background-color: aquamarine;
            float: left;
            box-sizing: border-box;
            padding: 30px;
        }

        .banner {
            width: 90%;
            background-color: aqua;
            float: right;
            box-sizing: border-box;
            padding: 30px;
        }

        #head-link {
            background-color: blue;
            padding: 5px;
            text-align: center;
        }

        .content::after {
            content: '';
            clear: both;
            display: table;
        }

        #left, #content, #right {
            width: 15%;
            float: left;
            box-sizing: border-box;
            height: 1300px;
            background-color: antiquewhite;
        }

        #content {
            width: 70%;
            background-color: aliceblue;
        }

        #right {
            background-color: wheat;
        }

        footer {
            padding: 30px;
            background-color: brown;
        }

        
    </style>
</head>
<body>
<header>
    <div id="head">
        <div class="logo">logo</div>
        <div class="banner">

            </div>
    </div>
    <div id="head-link">
        <ul style="list-style: none;display: inline-flex">
        <li ><a href="sale?action=add" style="text-decoration: none;padding-left: 10px">Thêm giỏ hàng</a> </li>
        <li ><a href="sale?action=update" style="text-decoration: none;padding-left: 10px">Chỉnh sửa mặt hàng</a> </li>
        <li ><a href="sale?action=buy" style="text-decoration: none;padding-left: 10px">Giỏ hàng</a> </li>
        </ul>
    </div>
</header>
<section class="content">
    <div id="left">left</div>
    <div id="content">content</div>
    <div id="right">right</div>
</section>
<footer>footer</footer>
</body>
</html>
