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
    <li class="list-group-item list-group-item-info" style="text-align: center">조회</li>
      <ol class="list-group list-group-numbered">
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}../session/accountView.jsp">계좌 조회</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">개인정보 조회</a>
      </ol>
    <li class="list-group-item list-group-item-info" style="text-align: center">이체</li>
      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}../send/sendForm.jsp">이체</a>

    <li class="list-group-item list-group-item-info" style="text-align: center">설정</li>
      <ol class="list-group list-group-numbered">
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">비밀번호 변경</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">탈퇴</a>
      </ol>
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">로그아웃</a>-->
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>-->
    <!--                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>-->
  </div>
</div>
</body>
</html>
