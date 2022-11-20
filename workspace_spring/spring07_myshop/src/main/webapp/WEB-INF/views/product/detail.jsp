<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-10
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>detail.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="/css/main.css" rel="stylesheet" type="text/css">

    <script>
        function product_update() {
            document.form1.action = "/product/update";
            document.form1.submit();
        } // product_update() end

        function product_delete() {
            if (confirm('영구히 삭제됩니다\n진행할까요?')) {
                document.form1.action = "/product/delete";
                document.form1.submit();
            } // if end
        } // product_delete() end

    </script>
</head>
<body>
<div class="container">
    <h3>상품상세보기 / 상품수정 / 상품삭제</h3>
    <p>
        <button type="button" onclick="location.href='/product/list'">상품전체목록</button>
    </p>

    <form name="form1" method="post" action="insert" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <td>상품명</td>
                <td><input type="text" name="product_name" value="${product.product_name}"></td>
            </tr>
            <tr>
                <td>상품가격</td>
                <td><input type="number" name="price" value="${product.price}"></td>
            </tr>
            <tr>
                <td>등록일</td>
                <td><input type="text" name="regdate" value="${product.regdate}"></td>
            </tr>
            <tr>
                <td>상품설명</td>
                <td>
                    <div rows="5" cols="60" name="description" id="description">${product.description}</div>
                </td>
            </tr>
            <tr>
                <td>상품사진</td>
                <td>
                    <c:if test="${product.filename != '-'}">
                        <img src="/storage/${product.filename}" width="100px">
                    </c:if>
                    <br>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="hidden" name="product_code" value="${product.product_code}">
                    <input type="hidden" name="original_filename" value="${product.filename}">
                    <input type="button" value="상품수정" onclick="product_update()">
                    <input type="button" value="상품삭제" onclick="product_delete()">
                </td>
            </tr>
        </table>
    </form>
    <hr>
</div>

<jsp:include page="comment.jsp"></jsp:include>

</body>
</html>
