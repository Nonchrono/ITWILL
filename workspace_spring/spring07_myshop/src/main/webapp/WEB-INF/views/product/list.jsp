<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-10
  Time: 오후 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>list</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>상품목록</h3>
<p>
    <button type="button" onclick="location.href='write'">상품등록</button>
    <button type="button" onclick="location.href='list'">상품전체목록</button>
</p>

<form method="post" action="search">
    상품명 : <input type="text" name="product_name" value="${product_name}">
            <input type="submit" value="검색">
</form>

<hr>
상품갯수 : ${fn:length(list)}
<br>
<table border="1">
<tr>
    <c:forEach var="row" items="${list}" varStatus="vs"> <!-- 329행에 productDAO.list()를 담은 list를 뜻함 -->
        <td>
            <c:choose>
                <c:when test="${row.FILENAME != '-'}">
                    <img src="/storage/${row.FILENAME}" width="100px">
                </c:when>
                <c:otherwise>
                    등록된 사진 없음!!<br>
                </c:otherwise>
            </c:choose>
            <br>
            상품명 : <a href="detail/${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a>
            <br>
            상품가격 : <fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>
        </td>
        <%-- 테이블 한줄에 5칸씩 --%>
        <c:if test="${vs.count mod 5==0}">
            <tr></tr>
        </c:if>
    </c:forEach>
</tr>
</table>

</body>
</html>
