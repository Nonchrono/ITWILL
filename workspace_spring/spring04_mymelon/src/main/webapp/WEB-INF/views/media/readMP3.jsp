<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-04
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>readMP3.jsp</title>
    <style>
        *{font-family: Arial; font-size: 24px; }
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="title">MP3 듣기</div>
    <div class="content">
        <p><strong>${dto.title}</strong></p>
        <img src="../storage/${dto.poster}" width="400"><br>
        <audio src="../storage/${dto.filename}" controls></audio>
    </div>

    <div class="bottom">
        <input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${dto.mediagroupno}'">
        <input type="button" value="HOME" onclick="location.href='/home.do'">
    </div>
</body>
</html>
