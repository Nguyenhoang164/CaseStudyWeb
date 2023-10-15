<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 09/10/2023
  Time: 8:34 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
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
    .content {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 10px;
        text-align: center;
        padding-bottom: 100px;
    }
    button {
        position: relative;
        width: 15em;
        height: 4em;
        outline: none;
        transition: 0.1s;
        background-color: transparent;
        border: none;
        font-size: 13px;
        font-weight: bold;
        color: #ddebf0;
    }

    #clip {
        --color: #2761c3;
        position: absolute;
        top: 0;
        overflow: hidden;
        width: 90%;
        height: 100%;
        border: 5px double var(--color);
        box-shadow: inset 0px 0px 15px #195480;
        -webkit-clip-path: polygon(30% 0%, 70% 0%, 100% 30%, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0% 30%);
    }

    .arrow {
        position: absolute;
        transition: 0.2s;
        background-color: #2761c3;
        top: 35%;
        width: 10%;
        height: 30%;
    }

    #leftArrow {
        left: -13.5%;
        -webkit-clip-path: polygon(100% 0, 100% 100%, 0 50%);
    }

    #rightArrow {
        -webkit-clip-path: polygon(100% 49%, 0 0, 0 100%);
        left: 105%;
    }

    button:hover #rightArrow {
        background-color: #27c39f;
        left: -15%;
        animation: 0.6s ease-in-out both infinite alternate rightArrow8;
    }

    button:hover #leftArrow {
        background-color: #27c39f;
        left: 102%;
        animation: 0.6s ease-in-out both infinite alternate leftArrow8;
    }

    .corner {
        position: absolute;
        width: 4em;
        height: 4em;
        background-color: #2761c3;
        box-shadow: inset 1px 1px 8px #2781c3;
        transform: scale(1) rotate(45deg);
        transition: 0.2s;
    }

    #rightTop {
        top: -1.98em;
        left: 91%;
    }

    #leftTop {
        top: -1.96em;
        left: -3.0em;
    }

    #leftBottom {
        top: 2.10em;
        left: -2.15em;
    }

    #rightBottom {
        top: 45%;
        left: 88%;
    }

    button:hover #leftTop {
        animation: 0.1s ease-in-out 0.05s both changeColor8,
        0.2s linear 0.4s both lightEffect8;
    }

    button:hover #rightTop {
        animation: 0.1s ease-in-out 0.15s both changeColor8,
        0.2s linear 0.4s both lightEffect8;
    }

    button:hover #rightBottom {
        animation: 0.1s ease-in-out 0.25s both changeColor8,
        0.2s linear 0.4s both lightEffect8;
    }

    button:hover #leftBottom {
        animation: 0.1s ease-in-out 0.35s both changeColor8,
        0.2s linear 0.4s both lightEffect8;
    }

    button:hover .corner {
        transform: scale(1.25) rotate(45deg);
    }

    button:hover #clip {
        animation: 0.2s ease-in-out 0.55s both greenLight8;
        --color: #27c39f;
    }

    @keyframes changeColor8 {
        from {
            background-color: #2781c3;
        }

        to {
            background-color: #27c39f;
        }
    }

    @keyframes lightEffect8 {
        from {
            box-shadow: 1px 1px 5px #27c39f;
        }

        to {
            box-shadow: 0 0 2px #27c39f;
        }
    }

    @keyframes greenLight8 {
        from {
        }

        to {
            box-shadow: inset 0px 0px 32px #27c39f;
        }
    }

    @keyframes leftArrow8 {
        from {
            transform: translate(0px);
        }

        to {
            transform: translateX(10px);
        }
    }

    @keyframes rightArrow8 {
        from {
            transform: translate(0px);
        }

        to {
            transform: translateX(-10px);
        }
    }

   .header{
       display: inline;
       width: 100%;
       height: 70px;
   }
   .left{
       float: left;
       width: 25%;

   }
   .right{
       float: right;
       width: 10%;
       font-size:15px;
       color: #000000;
       position: relative;
       right: 0;
   }
   .clear{
       clear: both;
   }
</style>
<body>

<video autoplay loop id="myVideo">
    <source src="/music/background/Official%20Promotion%20Video.mp4" type="video/mp4">
</video>
<div class="header">
    <div class="left"><img src="https://upload.wikimedia.org/wikipedia/commons/d/d0/Blue_Archive_EN_logo.svg"></div>
    <div class="right">
        <h3>UID: 133324135</h3>
        <h3>Server: Global</h3>
        <h3>Username: ${sessionScope['username']}</h3>
    </div>
</div>
<!-- Optional: some overlay text to describe the video -->
<div class="content">
    <a href="sales" style="text-decoration: none">
    <button style="color: black">
     P L A Y
        <div id="clip">
            <div id="leftTop" class="corner"></div>
            <div id="rightBottom" class="corner"></div>
            <div id="rightTop" class="corner"></div>
            <div id="leftBottom" class="corner"></div>
        </div>
        <span id="rightArrow" class="arrow"></span>
        <span id="leftArrow" class="arrow"></span>
    </button>
    </a>
</div>
<%--<div style="width: 100% ; height: 100% ; text-align: center;margin-top: 50%"><H1><b><a href="sales">Welcome back to Shop </a></b></H1></div>--%>
<div class="clear"></div>
</body>
</html>
