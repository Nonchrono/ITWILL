<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_form.jsp</title>
</head>
<body>
	<h3>* 성적 입력 *</h3>

	<form name="sungjukfrm" id="sungjukfrm" method="post" action="06_ok.jsp">
		이름:<input type="text" name="uname" id="uname" size="10" maxlength="20" placeholder="이름" required> 
		<hr>
		국어:<input type="number" name="kor" id="kor" size="5" min="0" max="100">
		<hr>
		영어:<input type="number" name="eng" id="eng" size="5" min="0" max="100">
		<hr>
		수학:<input type="number" name="mat" id="mat" size="5" min="0" max="100">
	  	<hr>
	  	<input type="submit" value="전송">
	  	<input type="reset"  value="취소">
	</form>

	<!-- 
		● [<form> 관련 다양한 속성들]
		  사용자가 입력한 정보를 서버로 전송하기 위한 양식
		  name		: 폼 이름. 서버에서 식별하기 위한 양식
		  id		: 폼 id. Frontend 단에서 식별자로 주로 사용
		  method	: 폼 전송 방식. get | post 방식, 생략시 기본은 get 방식
		  action	: 사용자가 요청한 정보를 서버가 받아서 처리할 결과 페이지
		  enctype	: 폼에서 파일을 첨부해서 서버로 전송하고자 할 때 "multipart/form-data" 추가
	
		● [<form> 전송 방식]
		
		  1) method = get 방식
		  	- 생략시 기본값
		  	- 사용자가 입력 요청한 정보가 URL 그대로 노출
		  	- 한글 안 깨짐
		  	- ok.jsp?서버로전송되는값들
		  	  형식) 요청 페이지(또는 명령어)?변수=값&변수=값&변수=값~~
		  	    예) http://localhost:9090/basic04_web/form/06_ok.jsp?uname=bluechip&kor=40&eng=50&mat=60
		  	- 예) 검색어
		  	
		  2) method = post 방식
		    - 사용자가 요청한 정보가 URL에 노출되지 않고 패키지화되서 서버로 전송
		    - 한글 깨짐
		    - 예) 비번, 주민번호, 카드번호 등
	 -->


</body>
</html>