<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-03
  Time: 오전 1:43
  To change this template use File | Settings | File Templates.
--%>

<%--&nbsp;&nbsp;&nbsp;&nbsp; <br>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formManage.css">
</head>
<body>
<h1>Login success</h1>
    <div class="containerView">
        <div class="itemInfo_view"><br>
            <div id="textArea"><%=session.getAttribute("UserName")%> 의 계좌</div>
            <div id="textArea"><%=session.getAttribute("UserAccount")%> <- 계좌번호</div>
            <div id="textArea"><%=session.getAttribute("UserMoney")%> <- 잔고</div>
            <div id="toSend">
                <button><a href="#" onclick="">to Send</a></button>
            </div>
        </div>
        <div class="itemSend_view">
            <div id="textSend">이체 : <%=session.getAttribute("sendList")%></div>

            <div class="paging">
                <a class="selectView" href="">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">5</a>

            </div>
        </div>
</div>
</body>
</html>
