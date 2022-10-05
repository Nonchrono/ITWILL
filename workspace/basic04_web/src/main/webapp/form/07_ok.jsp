<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>07_ok.jsp</title>
</head>
<body>
		 <h3>계산 결과</h3>
	   	  <hr>
	   	  
<%
		/*
		request.setCharacterEncoding("UTF-8");

		int num1 = Integer.parseInt(request.getParameter("num1").trim());
		int num2 = Integer.parseInt(request.getParameter("num2").trim());
		String op = request.getParameter("op").trim();
		int total;
		*/
		
		// 강사님 풀이
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 입력 요청한 정보 가져오기
		// 예) <input type="number" name="name1">
		int num1 = Integer.parseInt(request.getParameter("num1").trim());
		int num2 = Integer.parseInt(request.getParameter("num2").trim());
		String op = request.getParameter("op").trim();
%>
	
		<!-- 성적결과 테이블에 출력 -->
	<div class="container mt-3">
	   <table class="table table-hover">
	   <tr>
	      <td><%=num1%></td>
	      <td><%=op%></td>
	      <td><%=num2%></td>
	      <td><%
	      double sum = 0.0;
	      
	      		switch (op) {
		 	case "+": sum = num1+num2; break;
		 	
		 	case "-": sum = num1-num2; break;
		 	
		 	case "*": sum = num1*num2; break;
		 	
		 	case "/": sum = num1/num2; break;
		 	}
		 	
		 	out.print(sum);
		 	%></td>
	   </tr>
	   </table>
	</div>



</body>
</html>