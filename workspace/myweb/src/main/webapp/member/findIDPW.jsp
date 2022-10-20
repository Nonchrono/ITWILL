<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 findIDPW.jsp -->
<div class="container">
<h3>* ID & PW 찾기 *</h3>
<hr>
<br>
	<table class="table table-hover">
	<tr>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#findID">아이디 찾기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#findPW">비밀번호 찾기</button>
	</tr>
	</table> 
	
	<!-- Modal -->
  <div class="modal fade" id="findID" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이디 찾기</h4>
        </div>
        <div class="modal-body">
        	<!-- 본문 내용 시작 -->
        	<form name="findid" id="findid" method="post" action="findIDProc2.jsp">
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
        	<!-- 본문 내용 끝 -->
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="findPW" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 찾기</h4>
        </div>
        <div class="modal-body">
        	<!-- 본문 내용 시작 -->
        	<form name="findpw" id="findpw" method="post" action="findPWProc.jsp">
			<table class="table">
				<tr>
				    <td>
				       이름 : 
					   <input type="text" name="mname" id="mname" placeholder="성함" maxlength="10" required>
				    </td>
				</tr>
				<tr>
				    <td>
				       아이디 : 
					   <input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
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
					  <button type="submit">비밀번호 찾기</button>
				   </td>
				</tr>
			</table>
			</form>
        	<!-- 본문 내용 끝 -->
        </div>
      </div>
      
      
    </div>
  </div>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>