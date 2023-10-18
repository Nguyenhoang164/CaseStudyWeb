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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
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

        .content::after {
            content: '';
            clear: both;
            display: table;

        }

        #left, #content, #right {
            width: 20%;
            float: left;
            height: 100%;
            margin: 10px;


        }

        #content {
            width: 70%;
            float: left;
            display: inline-flex;
            flex-wrap: wrap;
            justify-content: space-between;

        }

        #right {
            width: 24%;
            text-align: center;
        }

        footer {
            padding: 30px;
        }

        body {
            background: url("https://w.wallha.com/ws/14/xupz5Ww8.jpg") no-repeat fixed;
            background-size: 100% 100%;
            font-family: "Arial", sans-serif;
        }

        li {
            font-family: Bahnschrift, serif;
        }

        .footer {
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            text-align: center;
            color: #ffffff;
        }

        .footer p {
            margin: 5px 0;
        }

        .footer a {
            text-decoration: none;
            margin: 0 10px;
        }

        #prizeTag {
            float: left;
        }

        #imgTag {
            border-radius: 15px;
        }

        body {

        }
    </style>
</head>
<body>
<header>
    <div id="head">
        <div class="logo">
            <img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/Blue_Archive_EN_logo.svg">
        </div>
        <div class="banner">
            <div style="float: right">
                <a href="login?action=logout&username=${sessionScope["username"]}" style="text-decoration: none"><i
                        class="bi bi-box-arrow-left"> Logout</i></a>
            </div>

            <h1 style="font-size: 50px"><b>Sensei! Welcome to Kivotos!</b></h1>
        </div>
    </div>
    <br>
    <div id="head-link" style="padding-top: 10px;background: rgba(255,255,255,0.87);border-radius: 15px">
        <ul style="list-style: none;display: inline-flex;justify-content: space-between">
            <li><a href="sales?action=check" style="text-decoration: none;padding-left: 30px;color: #000000"><i
                    class="bi bi-bag"></i><c:if test="${sessionScope['count'] != null}"><span
                    style="font-size: 15px;background-color: red;color: white;border-radius:30px;width: 30px;height: 30px">${sessionScope['count']}</span></c:if>
                <b style="padding-left: 10px">Giỏ hàng</b></a></li>
            <li><a href="sales?action=search" style="text-decoration: none;padding-left: 30px;color: #000000"><i
                    class="bi bi-search"></i><b style="padding-left: 10px">Tìm kiếm</b></a></li>
        </ul>
    </div>
</header>
<section class="content">
    <div id="content" style="background: rgba(0, 0, 0, 0.5); padding-top: 10px">
        <c:forEach var="item" items="${requestScope['list']}">
            <div style="color: #f1e1e1;height: 480px; border-radius: 15px;background:rgba(0, 0, 0, 0.5);margin: 2.5%;text-align: center">
                <div id="imgTag"><img src="${item.getUrlImg()}" style="width: 180px;height: 300px"></div>
                <div id="nameTag"><h3>${item.getName()}</h3></div>
                <div id="houseProduceTag"><p>${item.getHouseProduce()}</p></div>

                <div style="display: inline-flex;justify-content: space-between">
                    <div id="prizeTag"><p>${item.getPrize()}</p></div>
                    <div style="float: right;padding-top: 8px;padding-left: 2px"><img
                            src="https://files.cults3d.com/uploaders/19685247/illustration-file/b23a78c1-14ed-435d-92b1-1eb38e7712a6/1658060193.png"
                            style="width:20px;height: 30px"></div>
                </div>
                <div id="buttonTag">
                    <button style="background-color: #4caf50"><a href="sales?action=buy&id=${item.getId()}"
                                                                 style="text-decoration: none;color: white">Buy</a>
                    </button>
                </div>
            </div>

        </c:forEach>

    </div>

    <div id="right">
        <div style="padding-bottom: 5px;font-size: 20px"><b><a href="https://www.youtube.com/@mo2bluearchive"
                                                               style="text-decoration: none;color: black"> Top video
            last month</a></b></div>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/AqBVDJDB0ps?si=FkG8x5E1zDHYRiSe"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/ptSHzas31-U?si=dDCIb5P-bovMZY69"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/ZpRYJwPFbWY?si=DjPU00fCyXFXh_W6"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/DNpVcwjD1S8?si=gSPW08dNiHlKVdDD"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/JhWiVeXf2JM?si=_ws7GZZ5-OXBW-DC"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/pEg_d2f6myw?si=fIPEzHrGXnIvM9AC"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen style="width: 100%;height: 200px;padding-bottom: 20px"></iframe>
    </div>
    <audio autoplay>
        <source src="/music/background/Blue%20Archive%20OST%2021.%20Midnight%20Trip.mp4" type="audio/mpeg">
    </audio>
</section>
<br>
<footer class="footer">
    <p>Số điện thoại: 0123456789</p>
    <p>Địa chỉ: Đường ABC, Quận XYZ, Thành phố ABC</p>
    <p>Email: example@example.com</p>
    <p>
        <a href="https://www.facebook.com">Facebook</a>
    </p>
</footer>
</body>
</html>
