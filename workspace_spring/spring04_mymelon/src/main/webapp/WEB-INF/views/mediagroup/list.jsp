<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>list.jsp</title>
    <style>
        *{font-family: Arial; font-size: 24px; }
    </style>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="title">미디어 그룹 목록</div>
<div class="content">
    <input type="button" value="그룹등록" onclick="location.href='create.do'">
</div>

<c:if test="${requestScope.count == 0}">
    <table><tr><td>게시판에 글 없음!</td></tr></table>
</c:if>

<c:if test="${requestScope.count > 0}">   <!-- requestScope. 생략 가능 -->
    <table>
        <tr>
            <th>그룹번호</th>
            <th>그룹제목</th>
            <th>수정/삭제</th>
        </tr>

        <!-- MediagroupCont의 list()함수에서 mav.addObject("list")를 가리킴 -->
        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${dto.mediagroupno}</td>
                <td><a href="../media/list.do?mediagroupno=${dto.mediagroupno}">${dto.title}</a></td>
                <td>
                    <input type="button" value="수정" onclick="location.href='update.do?mediagroupno=${dto.mediagroupno}'">
                    <input type="button" value="삭제" onclick="location.href='delete.do?mediagroupno=${dto.mediagroupno}'"> <!-- Get 방식 -->
                </td>
            </tr>
        </c:forEach>

    </table>
</c:if>

<!-- 페이지 리스트 -->
<c:if test="${requestScope.count > 0}">
    <c:set var = "pageCount" value="${requestScope.totalPage}"/>
    <c:set var = "startPage" value="${requestScope.startPage}"/>
    <c:set var = "endPage" value="${requestScope.endPage}"/>

    <div class="content">
        <!-- endPage는 10단위이기에 총 페이지가 end 페이지보다 작으면 그 수를 대입한다 -->
        <!-- 즉, 만약 최종 페이지 수가 22라면 30까지 표시할 필요가 없으니 엔드 페이지 수를 22로 맞춘다 -->
        <c:if test="${endPage > pageCount}">
            <c:set var="endPage" value="${pageCount}"/>
        </c:if>

        <!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
        <c:if test="${startPage > 1}">
            <a href="./list.do?pageNum=${startPage-1}">[이전]</a>
        </c:if>

        <!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
        <!-- 현재 페이지가 아니라면 링크 걸기 (페이지 넘버 값을 가지고 간다) -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${pageNum == i}"><span style="font-weight: bold">${i}</span></c:when>
                <c:when test="${pageNum != i}"><a href="./list.do?pageNum=${i}">[${i}]</a></c:when>
            </c:choose>
        </c:forEach>

        <!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
        <c:if test="${endPage < pageCount}">
            <a href="./list.do?pageNum=${startPage+10}">[다음]</a>
        </c:if>
    </div>
</c:if>

</body>
</html>