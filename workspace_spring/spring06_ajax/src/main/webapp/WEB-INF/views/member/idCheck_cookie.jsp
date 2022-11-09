<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-09
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>idCheck_cookie.jsp</title>
    <script src="../js/jquery-3.6.1.min.js"></script>
    <script src="../js/jquery.cookie.js"></script>
</head>
<body>
<!-- 쿠키를 활용하여 아이디 중복확인을 해야만 회원가입이 가능하다 -->
<h3>회원등록폼(cookie)</h3>

<form name="memfrm" method="post" action="./insert.do" onsubmit="return send()">
    <table border="1" width="400px">
        <tr>
            <th>아이디</th>
            <td>
                <input type="text" name="userid" id="userid">
                <input type="button" value="아이디중복확인" id="btn_userid">
                <br>
                <span id="panel"></span><!-- 아이디 중복 관련 메세지 -->
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="passwd" id="passwd"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" id="email"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="회원가입">
            </td>
        </tr>
    </table>
</form>


<script>

    // 6) 해당 페이지가 로딩되었을 때 아이디 중복확인과 관련된 쿠키변수 삭제
    $(function() {
        $.removeCookie("checkID");
    }); // end


    // 1) id="btn_userid" 아이디 중복 확인 버튼을 클릭했을 때
    $("#btn_userid").click(function(){
        // 2) 입력한 id = "btn_userid" 값을 변수에 대입하기
        let params = "userid=" + $("#userid").val().trim();

        // 3) post 방식으로 서버에서 요청해서 응답 받기
        // 형식) $.post("요청명령어", 전달값, 콜백함수, 응답받는 형식)

        // ① text 응답
        //$.post("idcheckcookieproc.do", params, checkID, "text");

        // ② JSON 응답
        $.post("idcheckcookieproc.do", params, checkID, "json");

    }); // click() end

    // 4) 콜백함수
    function checkID(result) {

        // ① text 응답
        // alert(result); // 0 또는 1

        // ② JSON 응답
        alert(result);  // [object Object]
        console.log(result);

        // 5) 서버에서 응답 받는 메세지(result)를 본문의 id = panel에 출력하고
        // 쿠키 변수에 저장
        // 형식) $.cookie("쿠키변수명", 값)
        let count = eval(result.count); // 형변환
        if (count == 0) {
            $("#panel").css("color", "blue");
            $("#panel").text("사용 가능한 아이디입니다.");
            $.cookie("checkID", "PASS"); // 아이디 중복확인을 했다는 증거
        } else {
            $("#panel").css("color", "red");
            $("#panel").text("중복된 아이디입니다.");
            $("#userid").focus(); // 커서 생성
        } // if end

    } // checkID() end

    // 7) 아이디 중복확인을 해야만 회원가입폼이 서버로 전송
    function send() {
        // 아이디 입력했는지?
        let idck = document.getElementById("userid").value;
        if (idck.length < 2) {
            alert("아이디는 두글자 이상이어야합니다.")
            return false;
        }

        // 비밀번호는 입력했는지?
        let psck = document.getElementById("passwd").value;
        if (psck.length < 2) {
            alert("비밀번호는 두글자 이상이어야합니다.");
            return false;
        }

        // 이름은 입력했는지

        // 이메일은 입력했는지

        // 아이디 중복확인을 했는지
        let checkID = $.cookie("checkID"); // 쿠키 변수값 가져오기
        if (checkID == "PASS") {
            return true; // 서버로 전송
        } else {
            $("#panel").css("color", "green");
            $("#panel").text("아이디 중복 확인 해주세요~");
            $("#userid").focus(); // 커서 생성
            return false;
        } // if end
    } // send() end

</script>

</body>
</html>
