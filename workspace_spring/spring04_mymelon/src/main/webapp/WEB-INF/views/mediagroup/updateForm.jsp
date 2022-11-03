<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-02
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>updateForm.jsp</title>
    <style>
        *{ font-family: Arial; font-size: 24px;}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="title">미디어 그룹 수정</div>
    <form method="post" action="update.do">
        <input type="hidden" name="mediagroupno" value="${dto.mediagroupno}">
        <table class="table">
            <tr>
                <th>미디어 그룹 제목</th>
                <td><input type="text" name="title" size="50" value="${dto.title}"></td>
            </tr>
        </table>
        <div class="bottom">
            <input type="submit" value="수정">
            <input type="button" value="목록" onclick="location.href='list.do'">
        </div>
    </form>
</body>
</html>
