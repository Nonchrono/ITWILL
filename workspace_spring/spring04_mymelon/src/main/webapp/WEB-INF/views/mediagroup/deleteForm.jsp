<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-02
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteForm.jsp</title>
    <style>
      *{ font-family: Arial; font-size: 24px;}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="title">미디어 그룹 삭제</div>
    <form method="post" action="delete.do">
        <input type="hidden" name="mediagroupno" value="${requestScope.mediagroupno}">
        <div class="content">
            <p>미디어 그룹을 삭제하시겠습니까?</p>
            <p>※ 관련 미디어 파일(mp3, mp4)도 전부 삭제됩니다</p>
        </div>
        <div class="bottom">
            <input type="submit" value="삭제">
            <input type="button" value="목록" onclick="location.href='list.do'">
        </div>
    </form>


</body>
</html>
