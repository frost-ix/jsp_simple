<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-03
  Time: 오전 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formManage.css">
</head>
<body>

<div class="Info_title">
    <h1>나의 정보</h1>
    <hr>
</div>

    <div class="My_Info">
        <div class="Info">이름 :    <%=session.getAttribute("UserName")%></div><br>
        <br><div class="Info">아이디 :   <%=session.getAttribute("UserId")%></div><br>
        <br><div class="Info">계좌번호 :   <%=session.getAttribute("UserAccount")%></div><br>
        <br><div class="Info">잔액 :    <%=session.getAttribute("UserMoney")%></div><br>
    </div>

</body>
</html>
