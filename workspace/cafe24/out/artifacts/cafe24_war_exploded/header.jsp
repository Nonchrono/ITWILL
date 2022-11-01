<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="icon" href="../images/favicon.ico" type="image/x-icon" sizes="16x16">
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키 삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="../css/layout.css">
  <!-- <link rel="stylesheet" href="../css/animate.css"> -->
  <script src="../js/clock.js"></script>
  <script src="../js/myscript.js"></script>
</head>
<body>

<!-- 메인 카테고리 시작 -->
<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp">게시판</a></li>
        <li><a href="../notice/noticeList.jsp">공지사항</a></li>
        <li><a href='../member/loginForm.jsp'>로그인</a></li>
        <li><a href="../pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">
  <div class="row">
    <div class="col-sx-12">