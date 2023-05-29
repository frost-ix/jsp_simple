<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/29
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete test</title>
</head>
<body>
<jsp:include page="../common/Link.jsp"/>
<span style="color: chocolate; font-size: 1.2em;">
        <%= request.getAttribute("AccountDelErr") == null ? "" : request.getAttribute("AccountDelErr") %>
    </span>
<form action="deleteProcess.jsp" method="post" name="deleteForm">
    <h3>정말로 탈퇴 하시겠습니까?</h3>
    탈퇴를 하시려면 본인 이름과 계좌 비밀번호를 입력해주세요 <br>
    <input type="text" name="delName" placeholder="본인 이름"> <br>
    <input type="password" name="delPwd" placeholder="계정 비밀번호"> <br>
    <input type="password" name="delAccntPwd" placeholder="계좌 비밀번호"> <br>
    <input type="submit" value="탈퇴하기">
</form>

</body>
</html>
