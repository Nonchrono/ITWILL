<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-10
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>write.jsp</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css">
    <script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<h3>상품등록</h3>
<p>
    <button type="button" onclick="location.href='list'">상품전체목록</button>
</p>

<form name="form1" method="post" action="insert" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="product_name"></td>
        </tr>
        <tr>
            <td>상품가격</td>
            <td><input type="number" name="price"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="60" name="description" id="description"></textarea></td>
            <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
            CKEDITOR.replace('description',
                {filebrowserUploadUrl:'/product/imageUpload'
                });
            </script>
        </tr>
        <tr>
            <td>상품사진</td>
            <td><input type="file" name="img"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="상품등록">
            </td>
        </tr>
    </table>
</form>



</body>
</html>
