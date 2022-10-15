<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="./js/moment-with-locales.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키 삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="./css/layout.css">
  <script src="./js/clock.js"></script>
  <script src="./js/myscript.js"></script>

</head>
<body onload="showtime()">

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
      <%--<div style="display:inline-block;	vertical-align:top;">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index2.jsp">
      	<img src="./images/house.png">
      </a> 
      </div>--%>
      <div>
      <a class="navbar-brand" href="<%=request.getContextPath()%>./index.jsp">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
	  	<path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
	  	<path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
	  </svg>
      	Home
      </a>
      </div>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticelist.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- First Container 시작 -->
<div class="container-fluid bg-1 text-center" id="background">
  <div>
   <img src="./images/shinlogo.png" alt="로고" style="display:inline" width="12%">
  </div>
  <h3></h3>

  <img src="./images/shinchan000.gif" class="img-responsive img-thumbnail margin" style="display:inline" alt="짱구" width="30%">
</div> <!-- 메인 카테고리 끝 -->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">
  <div class="row">
    <div class="col-sx-12">
    	<!-- 본문 시작 -->
           <div id="clock"></div>
           
           
    	<!-- 본문 끝 -->
    </div> <!-- col 끝 -->
  </div> <!-- row 끝 -->
</div> <!-- Contents 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  Copyright &copy; 2022 MYWEB
</footer>

</body>
</html>
