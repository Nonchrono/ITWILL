<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 findID.jsp -->
<h3>* 아이디/비번 찾기 *</h3>
<form method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()"><!-- myscript.js -->
	<table class="table">
	<tr>
	    <td>
	       이름 : 
		   <input type="text" name="mname" id="mname" placeholder="성함" maxlength="10" required>
	    </td>
	</tr>
	<tr>
	   <td>
	   	  이메일 : 
	      <input type="text" name="email" id="email" placeholder="ex) email@naver.com" maxlength="50" required>
	   </td>
	</tr>
	<tr>
	   <td colspan="2">
		  <button type="submit">id 찾기</button>
	   </td>
	</tr>
	</table>
</form>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>