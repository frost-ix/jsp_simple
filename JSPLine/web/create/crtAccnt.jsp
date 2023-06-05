<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/23
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Test page</title>
</head>
<body>
<span style="color: coral; font-size: 1.2em;">
        <%= request.getAttribute("CreateError") == null ? "" : request.getAttribute("CreateError") %>
        <%= request.getAttribute("CreateCheck") == null ? "" : request.getAttribute("CreateCheck") %>
    </span>
<h1>Create 영역 테스트 !!</h1>
<form action="createProcess.jsp" method="post" name="Sign">
    <h3>계좌 생성의 경우, 12자리 중 9자리가 랜덤으로 생성됩니다.</h3>
    <h3>계좌잔액의 경우, 1원이 기본적으로 증정 됩니다.</h3>
    이름 : <input type="text" name="signName"><br>
    ID : <input type="text" name="signId"><br>
    PW : <input type="password" name="signPw"><br>
    계좌 비밀번호 : <input type="password" name="signAccntPw"><br>
    <input type="submit" value="회원가입 하기">
</form>
</body>
</html>
