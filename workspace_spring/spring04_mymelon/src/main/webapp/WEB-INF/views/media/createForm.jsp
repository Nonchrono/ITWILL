<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-03
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>createForm.jsp</title>
    <style>
        *{ font-family: Arial; font-size: 24px;}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="title">음원 등록</div>
    <form name="frm" method="post" action="create.do" enctype="multipart/form-data">
        <input type="hidden" name="mediagroupno" value="${requestScope.mediagroupno}">
        <table class='table'>
            <tr>
                <th>제목</th>
                <td><input type='text' name='title' size='50'></td>
            </tr>
            <tr>
                <th>포스터</th>
                <td><input type='file' name='posterMF' size='50'></td>
            </tr>
            <tr>
                <th>미디어 파일</th>
                <td><input type='file' name='filenameMF' size='50'></td>
            </tr>
        </table>

        <div class="bottom">
            <input type="submit" value="음원등록">
            <input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${requestScope.mediagroupno}'">
            <input type="button" value="HOME" onclick="location.href='/home.do'">
        </div>
    </form>

</body>
</html>
