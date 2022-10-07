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
<title>sungjukUpdateProc.jsp</title>
</head>
<body>
	<h3>* 성적 수정 *</h3>

<% 
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");

	// 사용자가 입력한 정보를 가져와서 변수에 담기
	String uname = request.getParameter("uname").trim();
	int kor = Integer.parseInt(request.getParameter("kor").trim());
	int eng = Integer.parseInt(request.getParameter("eng").trim());
	int mat = Integer.parseInt(request.getParameter("mat").trim());
	String addr = request.getParameter("addr");
	int aver=(kor+eng+mat)/3;
	
	// 2) dto 객체를 사용한 경우
	// 전달값을 모두 dto 객체에 담기
	dto.setUname(uname);
	dto.setKor(eng);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt = dao.updateproc(dto);
	
	if (cnt == 0) {
		out.println("<p>성적 입력이 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("	alert('성적이 입력되었습니다~');");
		out.println("	location.href='sungjukList.jsp'");
		out.println("</script>");
	} // if end
%>


</body>
</html>