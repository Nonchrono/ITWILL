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
		<title>sungjukRead.jsp</title>
		<style>
				a {
					text-decoration: none;
				}
		</style>
</head>
<body>
		<h3></h3>
		<h3 class="text-center">* 성적 상세목록 *</h3>
		<p>
				<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary">성적쓰기</button>
				<button type="button" onclick="location.href='sungjukList.jsp'" class="btn btn-secondary">성적목록</button>
		</p>
		
<%

			// 예) sungjukRead.jsp?sno=62
			int sno = Integer.parseInt(request.getParameter("sno"));
			
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
							sql.append(" WHERE sno = ? ");
							
							pstmt = con.prepareStatement(sql.toString());
							pstmt.setInt(1, sno);
							
							rs = pstmt.executeQuery();
							if  (rs.next()) {
%>
							<table class="table table-hover table-bordered">
							<tr>
									<th class="text-center">이름</th>
									<td><%=rs.getString("uname") %></td>
							</tr>
							<tr>
									<th class="text-center">국어</th>
									<td><%=rs.getString("kor") %></td>
							</tr>
							<tr>
									<th class="text-center">영어</th>
									<td><%=rs.getString("eng") %></td>
							</tr>
							<tr>
									<th class="text-center">수학</th>
									<td><%=rs.getString("mat") %></td>
							</tr>
							<tr>
									<th class="text-center">평균</th>
									<td><%=rs.getString("aver") %></td>
							</tr>
							<tr>
									<th class="text-center">주소</th>
									<td><%=rs.getString("addr") %>
<%
							String addr = rs.getString("addr");
							
							if (addr.equals("Seoul")) {
								out.print("서울");
							} else if (addr.equals("Jeju")) {
								out.print("제주");
							} else if (addr.equals("Suwon")) {
								out.print("수원");
							} else if (addr.equals("Busan")) {
								out.print("부산");
							}
%>
							</td>
							</tr>
							<tr>
									<th class="text-center">작성일</th>
									<td><%=rs.getString("wdate") %></td>
							</tr>
							</table>
							<br>
							<button type="button" onclick="location.href='sungjukUpdate.jsp?sno=<%=sno%>'" class="btn btn-secondary">수정</button>
							<button type="button" onclick="location.href='sungjukDel.jsp?sno=<%=sno%>'" class="btn btn-secondary">삭제</button>
<%
							} else {
								out.println("해당 글 없음");
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