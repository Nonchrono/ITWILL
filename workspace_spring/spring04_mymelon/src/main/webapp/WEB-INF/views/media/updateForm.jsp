<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-04
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>updateForm.jsp</title>
    <style>
      *{font-family: Arial; font-size: 24px; }
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="title">음원 수정</div>
    <form name="frm" method="post" action="update.do" enctype="multipart/form-data">
      <input type="hidden" name="mediano" value="${dto.mediano}">
      <input type="hidden" name="mediano" value="${dto.mediagroupno}"> <!-- 내글번호 -->
      <table class='table'>
        <tr>
          <th>제목</th>
          <td><input type='text' name='title' size='50' value="${dto.title}"></td>
        </tr>
        <tr>
          <th>포스터</th>
          <td>
            <img src="../storage/${dto.poster}" width="100"><br>
            <input type='file' name='posterMF' size='50'>
          </td>
        </tr>
        <tr>
          <th>미디어 파일</th>
          <td>
              등록된 파일명 : ${dto.filename}<br>
              <input type='file' name='filenameMF' size='50'>
          </td>
        </tr>
      </table>

      <div class="bottom">
        <input type="submit" value="음원 수정">
        <input type="button" value="음원 목록" onclick="location.href='list.do?mediano=${requestScope.mediano}'">
        <input type="button" value="HOME" onclick="location.href='/home.do'">
      </div>
    </form>

</body>
</html>
