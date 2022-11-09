<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-09
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bookTest.jsp</title>
    <script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h3>교재 선택</h3>

<select name="book" id="book">
    <option>--선택 --</option>
    <option value="0">spring</option>
    <option value="1">Android</option>
    <option value="2">jQuery</option>
    <option value="3">javaScript</option>
</select>
<br>
<div id="display"></div>

    <script>
        $("#book").change(function() {
            // alert($(this).val());
            $.post(
                    "booksend.do"
                    ,"book=" + $(this).val()
                    ,responseproc
            );
        }); // change() end

        function responseproc(result) {
            $("#display").html("<img src='../images/" + result + "'>")
        } // responseProc() end


    </script>
</body>
</html>
