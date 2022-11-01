<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-10-30
  Time: 오후 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 본문시작 my-page.jsp -->

<%
    String s_id3 = (String) session.getAttribute("s_id");
%>
    <div class="container">
    <table>
        <h3><%=s_id3%>님 환영합니다</h3><br>
        <br>
<%
    if (s_id3 != null) {
        out.println("<a href='../member/logout.jsp'>[로그아웃]</a>");
        out.println("<br><br>");
        out.println("<a href='../member/memberModify.jsp'>[회원정보수정]</a>");
        out.println("&nbsp;&nbsp;");
        out.println("<a href='../member/memberWithdraw.jsp'>[회원탈퇴]</a>");
    } else {
        out.println("<script>");
        out.println("   location.href='../member/loginForm.jsp';");
        out.println("   alert('로그인 후 이용해주세요!');");
        out.println("</script>");
    } // if end
%>
        </table>
    </div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>