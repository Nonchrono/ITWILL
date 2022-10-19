<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>

</head>
<body>
	<div style="text-align:center;">
	<h3>* 이메일 중복확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck2()">
			아이디 : <input type="text" name="email" id="email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>
	
	<script>
		function blankCheck2() {
			let email = $("#email").val();
			let exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
			email = email.trim();
			if (!exptext.text(email)) {
				alert("이메일 형식이 올바르지 않습니다");
				return false;
			}
			return true;
		} // blankCheck() end
	</script>
</body>
</html>