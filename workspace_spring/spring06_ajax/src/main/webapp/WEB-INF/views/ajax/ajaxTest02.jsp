<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-09
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajaxTest02.jsp</title>
    <script src="../js/jquery-3.6.1.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
</head>
<body>
<h3>* $.ajax() 테스트 *</h3>

<!-- 서버에서 응답 받은 내용을 panel에 쌓아보기 -->
<button id="btn">* 서버에서 응답받기 *</button>
<div id="panel"></div>

<script>
    // 1) $.ajax() 함수
    //    형식) $.ajax({name:value, name:"KOREA", name:1}) hashmap과 비슷한 형식

    /*
    $("#btn").click(function () {
        $.ajax({
            url         : "message.do"  // 요청 명령어
            , type      : "get"         // get 방식
            , dataType  : "text"        // 응답 메세지
            , error     : function(error) {
                alert("에러 : " + error);
            } // error callback 함수
            , success   : function(result) { // result는 서버가 응답해준 메세지
                // alert("성공 : " + result);
                $("#panel").append(result + "<br>"); // 결과 쌓이게 하기

                // $("#panel").empty();      // 기존에 있는 거 지우고 이번꺼로 다시
                // $("#panel").text(result); // 단순 문자열로 출력
                // $("#panel").html(result); // HTML 구조로 출력
            } // success callback 함수
        }); // ajax() end
    }); // click() end
    */

    // 2) $.get() 방식
    // AJAX를 GET 방식으로 요청하는 방식
    // 형식) $.get("요청 명령어", callback 함수)
    $("#btn").click(function() {
        $.get("message.do", responseProc);
    }); // click() end

    function responseProc(result) {
        $("#panel").append(result);
    } // responseProc() end


</script>

</body>
</html>
