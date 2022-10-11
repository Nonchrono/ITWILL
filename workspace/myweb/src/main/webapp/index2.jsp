<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>index2.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../jQuery/moment-with-locales.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키 삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="css/layout.css">

  <script>
  
     function showtime() {               
         const d = new Date();
         
         let today=""; // 결과값

         // 년도
         today += d.getFullYear() + "."; // 2022.

         // 달
         if (10 > d.getMonth()+1) {
             today += "0"+(d.getMonth()+1)+"."; // 2022.08
         } else {
             today += (d.getMonth()+1)+".";
         }

         // 일
         if (10 > d.getDate()) {
             today += "0";
         }
         today += d.getDate()+" ";   // 2022.08.10

         switch(d.getDay()) {
             case 0: today +=" (일) "; break;
             case 0: today +=" (월) "; break;
             case 0: today +=" (화) "; break;
             case 0: today +=" (수) "; break;
             case 0: today +=" (목) "; break;
             case 0: today +=" (금) "; break;
             case 0: today +=" (토) "; break;
         } // switch end


         // 시간
         if (12 < d.getHours()) {
             today += "PM "+(d.getHours()-12)+":";
         } else {
             today += "AM "+d.getHours()+":";
         }


         // 분
         if (10 > d.getMinutes()) {
             today += "0" + d.getMinutes()+":";
         } else {
             today += d.getMinutes()+":";
         }


         // 초
         if (10 > d.getSeconds()) {
             today += "0" + d.getSeconds();
         } else {
             today += d.getSeconds();
         }

         document.getElementById("clock").innerText=today;

         timer = setTimeout(showtime, 1000); // 1초 후에 showtime 함수 호출
         // let timer;가 생략되어 있기 때문에 timer에 들어간 값이 실행이 된다.
     } // showtime();
     
     let timer;  // 전역변수

     function killtime() {
         clearTimeout(timer);
         // timer를 잡아야하는 건 변수는 범위이기 때문. 값을 직접 넣으면 안 된다.
     } // killtime() end

     // 전역변수에 안 넣고 바로 함수에 넣으니 작동 안 함
 	</script>
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
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index2.jsp">
      	<img src="./images/house.svg" class="homebtn1">
      	<img src="./images/house-fill.svg" class="homebtn2">
      </a>
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
