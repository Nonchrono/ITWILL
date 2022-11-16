<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>

<form id="loginForm" name="loginForm">
    <table>
        <tr>
            <td>아이디 : <input type="text" id="loginID" name="loginID"></td>
            <td rowspan="2"><img src="${pageContext.request.contextPath}/images/login.png" style="width: 50px;"></td>
        </tr>
        <tr>
            <td>비밀번호 : <input type="password" id="loginPW" name="loginPW"></td>
        </tr>
    </table>


</form>