<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukUpdateProc.jsp</title>
</head>
<body>
		<h3>* 성적 수정 *</h3>
<%
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 사용자가 입력한 정보를 가져와서 변수에 담기
		int sno = Integer.parseInt(request.getParameter("sno"));
		String uname = request.getParameter("uname").trim();
		int kor = Integer.parseInt(request.getParameter("kor").trim());
		int eng = Integer.parseInt(request.getParameter("eng").trim());
		int mat = Integer.parseInt(request.getParameter("mat").trim());
		String addr = request.getParameter("addr");
		
		
		
		// 평균 구하기
		int aver=(kor+eng+mat)/3;

		
		// Oracle DB 연결 및 행 추가 =========================================== 대단히 오래된 방식
		Connection con = null;
		PreparedStatement psmt = null;
		
		try {
						// 1) 오라클DB 서버 연결 관련 정보
						String url		="jdbc:oracle:thin:@localhost:1521:xe";		// 127.0.0.1 이라고 써도 동일 // 1521는 오라클의 호스트 번호
						String user		="system";
						String password	="1234";
						String driver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar					
						// 2) 드라이버 로딩
						Class.forName(driver);			
						con = DriverManager.getConnection(url, user, password);
						// 3) 오라클 DB 서버 연결
						DriverManager.getConnection(url, user, password);
						System.out.println("오라클DB 서버 연결 성공!");
						
						StringBuilder sql = new StringBuilder();
						sql.append(" update sungjuk ");
						sql.append(" set uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate ");
						sql.append(" WHERE sno = ? ");
						
						PreparedStatement pstmt = con.prepareStatement(sql.toString());
						pstmt.setString(1, uname); 
						pstmt.setInt(2, kor); 
						pstmt.setInt(3, eng); 
						pstmt.setInt(4, mat);  
						pstmt.setInt(5, aver);
						pstmt.setString(6, addr);  
						pstmt.setInt(7, sno);
						
						int cnt = pstmt.executeUpdate();	// 실행했을 때 행의 갯수가 반환
						if (cnt == 0) {
							out.println("<p>성적 수정이 실패했습니다!!</p>");
							out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
						} else {
							out.println("<script>");
							out.println("					alert('성적이 수정되었습니다~');");
							out.println("					location.href='sungjukList.jsp'");
							out.println("</script>");
						} // if end
						
		} catch (Exception e) {
			out.println("오라클DB연결실패 : " + e);
		} finally { // 자원반납 (순서주의)
			try {
				if(psmt!=null) {psmt.close();}
			} catch (Exception e) {}
			try {
				if(con!=null) {con.close();}
			} catch (Exception e) {}
		} // end
%>

</body>
</html>