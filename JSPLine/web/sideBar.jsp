<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/06/04
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<div class="border-end bg-white" id="sidebar-wrapper">

  <div class="sidebar-heading border-bottom bg-light"><a class="nav-link" href="${pageContext.request.contextPath}../index.jsp">Simple Bank</a></div>
  <div class="list-group list-group-flush">
    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}../send/sendForm.jsp">이체</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}../session/accountView.jsp">조회</a>
    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">설정</a>
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">로그아웃</a>-->
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>-->
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>-->
  </div>
</div>
</body>
</html>
