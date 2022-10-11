<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>sungjukUpdate.jsp</title>
</head>
<body>
	<br>
	<h3>* 성적 수정 *</h3>
	<p>
		<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary">성적쓰기</button>
		<button type="button" onclick="location.href='sungjukList.jsp'" class="btn btn-secondary">성적목록</button>
	</p>
<%
	// 수정하고자 하는 글 번호 sungjukUpdate.jsp?sno=62
	int sno = Integer.parseInt(request.getParameter("sno"));

	dto = dao.update(sno);
	if(dto == null) {
		out.print("해당 글 없음!!");
	} else {
%>
	<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
			<input type="hidden" name="sno" value="<%=dto.getSno()%>">
			<table>
			<tr>
			  <th>이름</th>
			  <td><input type="text" name="uname" value="<%=dto.getUname()%>" maxlength="20" required autofocus></td>
			</tr> 
			<tr>
			  <th>국어</th>
			  <td><input type="number" name="kor" value="<%=dto.getKor()%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
			<tr>
			  <th>영어</th>
			  <td><input type="number" name="eng" value="<%=dto.getEng()%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr> 
			<tr>
			  <th>수학</th>
			  <td><input type="number" name="mat" value="<%=dto.getMat()%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
			<tr>
			  <th>주소</th>
			  <td>
			  	  <% String addr=dto.getAddr(); %>
			      <select name="addr">
		              <option value="Seoul" <% if (addr.equals("Seoul")) {out.print("selected");} %>>서울</option>
		              <option value="Jeju" <% if (addr.equals("Jeju")) {out.print("selected");} %>>제주</option>
		              <option value="Suwon" <% if (addr.equals("Suwon")) {out.print("selected");} %>>수원</option>
		              <option value="Busan" <% if (addr.equals("Busan")) {out.print("selected");} %>>부산</option>
			      </select> 
			  </td>
			</tr>
			<tr>
			  <td colspan="2" align="center">
			     <input type="submit" value="수정">
			     <input type="reset"  onclick="location.href='sungjukList.jsp'" value="취소">
			  </td>
			</tr>
		</table>
	</form>
<%
	}
%>
</body>
</html>