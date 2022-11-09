<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-09
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>idCheck.jsp</title>
    <script src="../js/jquery-3.6.1.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
</head>
<body>
<h3>회원등록폼</h3>
<form name="memfrm">
    <table border="1" width="400px">
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" id="userid">
                <input type="button" value="아이디중복확인" id="btn_userid">
                <br>
                <div id="panel" style="display:none"></div>
            </td>
        </tr>
    </table>
</form>

<script>
// $.post("요청 명령어", 전달값, callback 함수)

$("#btn_userid").click(function (){
    $.post(
            "idcheckproc.do"                // 요청 명령어
            ,"userid="+ $("#userid").val()  // 전달값
            ,responseproc);                 // 콜백함수
}); // click() end

function responseproc(result) { // result : 서버가 응답해준 메세지를 받는 변수
    $("#panel").empty();
    $("#panel").html(result);
    $("#panel").show();
} // responseProc() end

</script>
</body>
</html>
