<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/18
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>get DB test</title>
</head>
<body>
<script>
    function validateForm(form) {
        if (!form.id.value) {
            alert("아이디가 비어있습니다.");
            return false;
        }
        if (!form.pw.value) {
            alert("아이디와 비밀번호 둘 다 비어있습니다.");
            return false;
        }
    }
</script>
<div class="app">
<h1>Test page......</h1>
    <form action="LoginProcess.jsp" method="post" name="loginForm" onsubmit="return validateForm(this);">
        ID : <input type="text" name="id"><br>
        PW : <input type="password" name="pw"><br>
        <input type="submit" value="보내기">
    </form>
</div>
</body>
</html>
