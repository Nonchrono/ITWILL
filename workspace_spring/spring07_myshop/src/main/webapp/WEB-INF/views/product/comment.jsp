<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-14
  Time: 오후 10:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 댓글 -->
<div class="container">
    <label for="content">댓글</label>
    <form name="commentInsertForm" id="commentInsertForm">
        <div>
            <input type="hidden" name="pno" value="${product.product_code}"> <!-- 부모 글 번호 -->
            <input type="text" name="content" id="content" placeholder="내용을 입력해주세요">
            &nbsp;
            <button type="button" name="commentInsertBtn" id="commentInsertBtn" class="btn btn-success">등록</button>
        </div>
    </form>
</div>

<div class="container">
    <hr>
    <div class="commentList"></div>
</div>

<!-- 댓글 관련 자바스크립트 -->
<script>
    let pno = '${product.product_code}' // 부모 글 번호

    // 댓글 등록버튼 클릭했을 때
    $("#commentInsertBtn").click(function () {
        // id="commentIsertForm"의 내용을 전부 가져옴
        let insertData = $("#commentInsertForm").serialize();
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

                let a = ''; // 출력할 결과물 몰아넣기
                $.each(data, function (key, value) {
                    // alert(key);     // 순서 0 1 2
                    // alert(value);   // [object object]
                    // alert(value.cno);
                    // alert(value.pno);
                    // alert(value.content);
                    // alert(value.wname);
                    // alert(value.regdate);
                    a += '<div class="commentArea" style="border-bottom: 1px solid darkgray; margin-bottom: 15px">';
                    a += '  <div class="commentInfo' + value.cno + '">';
                    a += '      댓글번호 : ' + value.cno + ' / 작성자 : ' + value.wname + " / 작성일 " + value.regdate;
                    a += '      <a href="javascript:commentUpdate(' + value.cno + ',\'' + value.content + '\');">수정</a>';
                    a += '      <a href="javascript:commentDelete(' + value.cno + ');">삭제</a>';
                    a += '  </div>';
                    a += '  <div class="commentContent' + value.cno + '">'
                    a += '      <p>내용 : ' + value.content + '</p>';
                    a += '  </div>'
                    a += '</div>';
                }); // each() end

                $(".commentList").html(a);

            } // success end
        }); // ajax() end
    } // commentList() end

    $(document).ready(function () { // 페이지 로딩시 댓글 목록 출력
        commentList();
    }) // ready() end

    // 댓글 삭제
    function commentDelete(cno) {
        $.ajax({
           url:'/comment/delete/' + cno
            ,type:'post'
            ,success:function (data) {
                // if문 1줄은 중괄호 생략 가능
               if (data == 1) commentList(); // 댓글 삭제 후 목록 출력
            } // success end
        }); // ajax() end
    } // commentDelete()

    // 댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
    function commentUpdate(cno, content) {
        let a = '';
        a += '<div class="input-group">'
        a += '  <input type="text" value="' + content + '"  id="content_' + cno + '">';
        a += '  <button type="button" onclick="commentUpdateProc(' + cno + ')">수정</button>';
        a += '</div>'

        $(".commentContent" + cno).html(a);
    } // commentUpdate() end

    // 댓글 수정
    function commentUpdateProc(cno) {

        let updateContent = $('#content_' + cno).val();
        // alert(cno);
        // alert(updateContent);

        $.ajax({
            url:'/comment/update'
            ,type:'post'
            ,data:{'content':updateContent, 'cno':cno}
            ,success:function (data) {
                if(data == 1) {
                    commentList(); // 댓글 수정 후 목록 출력
                } // if end
            } // success end
        }); // ajax() end
    } // commentUpdateProc() end

</script>
