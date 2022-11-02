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
    <title>msgView.jsp</title>
    <style>
      *{ font-family: Arial; font-size: 24px;}
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <div class="title">알림</div>
  <div class="content">
    <dl>
      <dd>${msg1 != null ? img : ""} ${msg1}</dd>
      <dd>${msg2 != null ? img : ""} ${msg2}</dd>
      <dd>${msg3 != null ? img : ""} ${msg3}</dd>
    </dl>
    <p>
      ${link1} ${link2} ${link3}
    </p>
  </div>
</body>
</html>
