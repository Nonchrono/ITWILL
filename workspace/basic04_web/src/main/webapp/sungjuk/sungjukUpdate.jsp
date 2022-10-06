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
		<title>sungjukUpdate.jsp</title>
		<!-- sungjukRead.jsp 참조  -->
		<style>
				a {
					text-decoration: none;
				}
		</style>
</head>
<body>
		<h3></h3>
		<h3 class="text-center">* 성적 수정 *</h3>
		<p>
				<button type="button" onclick="location.href='sungjukForm.jsp'" class="btn btn-secondary">성적쓰기</button>
				<button type="button" onclick="location.href='sungjukList.jsp'" class="btn btn-secondary">성적목록</button>
		</p>
		
<%
			// 수정하고자 하는 글 번호 sungjukUpdate.jsp?sno=62
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
										// 2)단계. 1)의 내용을 폼에 출력 sungjukForm.jsp 참조
%>

				<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
						<input type="hidden" name="sno" value="<%=sno%>">
						<table>
						<tr>
						  <th>이름</th>
						  <td><input type="text" name="uname" value="<%=rs.getString("uname") %>" maxlength="20" required autofocus></td>
						</tr> 
						<tr>
						  <th>국어</th>
						  <td><input type="number" name="kor" value="<%=rs.getString("kor") %>" size="5" min="0" max="100" placeholder="숫자입력"></td>
						</tr>
						<tr>
						  <th>영어</th>
						  <td><input type="number" name="eng" value="<%=rs.getString("eng") %>" size="5" min="0" max="100" placeholder="숫자입력"></td>
						</tr> 
						<tr>
						  <th>수학</th>
						  <td><input type="number" name="mat" value="<%=rs.getString("mat") %>" size="5" min="0" max="100" placeholder="숫자입력"></td>
						</tr>
						<tr>
						  <th>주소</th>
						  <td>
						  	  <% String addr=rs.getString("addr"); %>
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