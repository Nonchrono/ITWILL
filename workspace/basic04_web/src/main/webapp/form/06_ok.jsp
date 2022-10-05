<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>06_ok.jsp</title>
</head>
<body>
	<h3>* 성적 결과 *</h3>
<% 
	// request 내부객체 (★★★★★)
	// -> 사용자가 요청한 모든 정보를 관리하는 객체
	
	// request.getParameter("") 메소드
	// -> 사용자가 입력한 정보를 개별적으로 가져올 때
	// -> 예) <input type="text" name="uname">
	// 		  request.getParameter("uname") 사용자가 입력한 uname값 가져온다
	/*
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>");
	*/
	
	// method=post 방식이면 한글이 깨짐
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");		// 조합형 // 2바이트 이상의 언어가 있다면 UTF-8로 인코딩해주는 메소드
	// request.setCharacterEncoding("EUC-KR");  // 완성형

%>

<%
	//사용자가 입력 요청한 정보를 개별적으로 가져와서 변수에 담기
	String uname = request.getParameter("uname");
	int kor = Integer.parseInt(request.getParameter("kor").trim());
	int eng = Integer.parseInt(request.getParameter("eng").trim());
	int mat = Integer.parseInt(request.getParameter("mat").trim());
	int aver = (kor+eng+mat)/3;
%>

	<!-- 성적결과 테이블에 출력 -->
	<div class="container mt-3">
	   <table class="table">
	   <tr>
	      <th class="table-success">이름</th>
	      <td><%=uname%></td>
	   </tr>
	   <tr>
	      <th class="table-success">국어</th>
	      <td><%=kor%></td>
	   </tr>
	   <tr>
	      <th class="table-success">영어</th>
	      <td><%=eng%></td>
	   </tr>
	   <tr>
	      <th class="table-success">수학</th>
	      <td><%=mat%></td>
	   </tr>
	   <tr>
	      <th class="table-success">평균</th>
	      <td><%=aver%></td>
	   </tr>
	   </table>
	</div>
</body>
</html>