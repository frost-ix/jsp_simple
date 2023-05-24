<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/24
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
</head>
<body>
<span style="color: coral; font-size: 1.2em;">
        <%= request.getAttribute("CreateError") == null ? "" : request.getAttribute("CreateError") %>
    </span>
<h2>Update Test</h2>
<form action="updateProcess.jsp" method="post" name="update">
    <h3>변경할 비밀번호를 입력하는 공간.</h3>
    이전 비밀번호 : <input type="password" name="old_pass"><br>
    변경할 비밀번호 : <input type="password" name="new_pass"><br>
    한번 더 입력해주세요 : <input type="password" name="new_check_pass"><br>
    <input type="submit" value="보내기">
</form>
</body>
</html>
