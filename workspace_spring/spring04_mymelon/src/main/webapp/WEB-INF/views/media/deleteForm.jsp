<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-04
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteForm.jsp</title>
    <style>
        *{font-family: Arial; font-size: 24px; }
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
</head>
<body>
    <div class="title">음원 삭제</div>
    <form method="post" action="delete.do">
        <input type="hidden" name="mediano" value="${requestScope.mediano}">
        <div class="content">
            <p>음원을 삭제하시겠습니까?</p>
            <p>※ 관련 미디어 파일(mp3, mp4)도 전부 삭제됩니다</p>
        </div>
        <div class="bottom">
            <input type="submit" value="삭제진행">
            <input type="button" value="HOME" onclick="location.href='/home.do'"> <!-- 절대 경로 -->
        </div>
    </form>
</body>
</html>
