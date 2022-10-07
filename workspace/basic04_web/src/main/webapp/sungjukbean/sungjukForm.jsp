<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>sungjukForm.jsp</title>
</head>
<body>
			<h3  class="text-center">* 성적 입력 폼 *</h3>
			<p  class="text-center"><button type="button" onclick="location.href='sungjukList.jsp'" class="btn btn-success">성적목록</button></p>			
			<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukIns.jsp" class="container mt-3">
				<table class="table table-bordered table-hover">
				<tr>
				  <th  class="table-warning">이름</th>
				  <td><input type="text" name="uname" maxlength="20" required autofocus></td>
				</tr> 
				<tr>
				  <th  class="table-warning">국어</th>
				  <td><input type="number" name="kor" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th  class="table-warning">영어</th>
				  <td><input type="number" name="eng" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr> 
				<tr>
				  <th  class="table-warning">수학</th>
				  <td><input type="number" name="mat" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th  class="table-warning">주소</th>
				  <td>
				      <select name="addr">
			              <option value="Seoul">서울</option>
			              <option value="Jeju">제주</option>
			              <option value="Suwon">수원</option>
			              <option value="Busan">부산</option>
				      </select> 
				  </td>
				</tr>
				<tr>
				  <td colspan="2" align="center">
				     <input type="submit" value="전송" class="btn btn-success">
				     <input type="reset"  value="취소" class="btn btn-danger">
				  </td>
				</tr>
			</table>
		</form>
</body>
</html>