<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 8:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    #myVideo {
        position: fixed;
        right: 0;
        bottom: 0;
        min-width: 100%;
        min-height: 100%;
    }
    #myBtn {
        width: 200px;
        font-size: 18px;
        padding: 10px;
        border: none;
        background: #000;
        color: #fff;
        cursor: pointer;
    }
    .content {
        position: fixed;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        color: #f1f1f1;
        width: 100%;
        padding: 20px;
    }
    #myBtn:hover {
        background: #ddd;
        color: black;
    }
    /*body{*/

    /*    background: url("https://c4.wallpaperflare.com/wallpaper/466/8/851/blue-archive-hd-wallpaper-preview.jpg") no-repeat fixed;*/
    /*    background-size: 100% 100%;*/
    /*}*/

</style>
<body>
<video autoplay loop id="myVideo">
    <source src="/music/background/Official%20Promotion%20Video.mp4" type="video/mp4">
</video>
<!-- Optional: some overlay text to describe the video -->
<div class="content">
    <button id="myBtn"><a href="sales">Welcome back to Shop </a></button>
</div>
<%--<div style="width: 100% ; height: 100% ; text-align: center;margin-top: 50%"><H1><b><a href="sales">Welcome back to Shop </a></b></H1></div>--%>

</body>
</html>
