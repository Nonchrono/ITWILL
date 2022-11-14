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
    <title>detail.jsp</title>
    <script src="/js/jquery-3.6.1.min.js"></script>
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
<h3>상품상세보기 / 상품수정 / 상품삭제</h3>
<p>
    <button type="button" onclick="location.href='/product/list'">상품전체목록</button>
</p>

<form name="form1" method="post" action="insert" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="product_name" value="${product.PRODUCT_NAME}"></td>
        </tr>
        <tr>
            <td>상품가격</td>
            <td><input type="number" name="price" value="${product.PRICE}"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea></td>
        </tr>
        <tr>
            <td>상품사진</td>
            <td>
                <c:if test="${product.FILENAME != '-'}">
                    <img src="/storage/${product.FILENAME}" width="100px">
                </c:if>
                <br>
                <input type="file" name="img">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
                <input type="hidden" name="original_filename" value="${product.FILENAME}">
                <input type="button" value="상품수정" onclick="product_update()">
                <input type="button" value="상품삭제" onclick="product_delete()">
            </td>
        </tr>
    </table>
</form>

<hr>
<!-- 댓글 -->
<div class="container">
    <label for="content">댓글</label>
    <form name="commentInsertForm" id="commentInsertForm">
        <div>
            <input type="hidden" name="pno" value="${product.PRODUCT_CODE}"> <!-- 부모 글 번호 -->
            <input type="text" name="content" id="content" placeholder="내용을 입력해주세요">
            <button type="button" name="commentInsertBtn" id="commentInsertBtn">등록</button>
        </div>
    </form>
</div>
<hr>
<div class="container">
    <div class="commentList"></div>
</div>

<!-- 댓글 관련 자바스크립트 -->
<script>
    let pno = '${product.PRODUCT_CODE}' // 부모 글 번호

    // 댓글 등록버튼 클릭했을 때
    $('#commentInsertBtn').click(function () {
        // id="commentIsertForm"의 내용을 전부 가져옴
        let insertData = $('#commentInsertForm').serialize();
        // alert(insertData); // pno=41&content=happy
        commentInsert(insertData);
    }); // click() end

    function commentInsert(insertData) {
        // alert("댓글 등록 함수 호출 : " + insertData);
        $.ajax({
            url: '/comment/insert'       // 명령어
            , type: 'post'               // post 방식
            , data: insertData           // 응답 메세지 타입
            , success: function (data) { // 요청이 성공했을 때 호출할 콜백 함수
                // alert(data);
                if (data == 1) {            // 댓글 등록 성공
                    commentList();         // 댓글 작성 후 댓글 목록 함수 호출
                    $('#content').val(''); // 기존 댓글 내용을 빈값으로 초기화
                } // end
            } // success end
        }); // ajax() end
    } // commentInsert() end

    // 댓글 목록
    function commentList() {
        $.ajax({
            url: '/comment/list'
            , type: 'get'
            , data: {'pno': pno} // 부모글번호
            , success: function (data) {
                // alert(data); // [object Object]

                $.each(data, function (key, value) {
                    // alert(key);     // 순서 0 1 2
                    // alert(value);   // [object object]
                    // alert(value.cno);
                    // alert(value.pno);
                    // alert(value.content);
                    // alert(value.wname);
                    // alert(value.regdate);
                }); // each() end

            } // success end
        }); // ajax() end
    } // commentList() end

    $(document).ready(function() { // 페이지 로딩시 댓글 목록 출력
        commentList();
    }) // ready() end

</script>

</body>
</html>
