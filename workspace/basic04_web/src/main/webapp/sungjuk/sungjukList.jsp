<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		<title>sungjukList.jsp</title>
		<style>
			a {
					text-decoration: none;
				}
		</style>
</head>
<body>
		<h3></h3>
		<h3 class="text-center">* 성적 목록 *</h3>
		<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary" align="right" 
		>성적쓰기</button>
	<div class="container mt-3">
		<table class="table table-bordered table-hover">
		<tr class="table-warning">
				<th  scope="col" class="text-center">이름</th>
				<th  scope="col" class="text-center">국어</th>
				<th  scope="col" class="text-center">영어</th>
				<th  scope="col" class="text-center">수학</th>
				<th  scope="col" class="text-center">등록일</th>
				<th  scope="col" class="text-center">상세보기</th>
		</tr>
<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
							String url		="jdbc:oracle:thin:@localhost:1521:xe";	
							String user		="system";
							String password	="1234";
							String driver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar			
							Class.forName(driver);			
							con = DriverManager.getConnection(url, user, password);
							System.out.println("오라클DB 서버 연결 성공!");
							
							StringBuilder sql = new StringBuilder();
							sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
							sql.append(" FROM sungjuk ");
							sql.append("ORDER BY sno DESC ");
							
							pstmt = con.prepareStatement(sql.toString());
							rs = pstmt.executeQuery();
							if  (rs.next()) {
								do {
%>
							<tr>
									<td><a href="sungjukRead.jsp?sno=<%=rs.getString("sno") %>"><%=rs.getString("uname") %></a></td>
									<td><%=rs.getString("kor") %></td>
									<td><%=rs.getString("eng") %></td>
									<td><%=rs.getString("mat") %></td>
									<td><%=rs.getString("wdate").substring(0, 10) %></td>
							</tr>							
<% 							
								} while(rs.next());
							} else {
								out.println("<tr>");
								out.println("			<td colspan='5'>글없음!!</td>");
								out.println("</tr>");
							} // if end
														
																					
			} catch (Exception e) {
				out.println("오라클DB연결실패 : " + e);
			} finally { // 자원반납 (순서주의)
				try {
					if(rs!=null) {rs.close();}
				} catch (Exception e) {}
				try {
					if(pstmt!=null) {pstmt.close();}
				} catch (Exception e) {}
				try {
					if(con!=null) {con.close();}
				} catch (Exception e) {}
			} // end

%>		
		</table>
	</div>
		
</body>
</html>