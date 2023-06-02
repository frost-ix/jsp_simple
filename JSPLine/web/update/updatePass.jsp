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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formManage.css">

</head>
<body>

<span style="color: coral; font-size: 1.2em;">
        <%= request.getAttribute("CreateError") == null ? "" : request.getAttribute("CreateError") %>
    </span>

<div class="main_Update">

<form action="updateProcess.jsp" method="post" name="update">


   <div class="title_Update">
        <h3>비밀번호 변경</h3>
   </div>

    <div class="textAreaPass">
         <input type="password" name="old_pass" placeholder="이전 비밀번호"><br>
    </div>

    <div class="textAreaPass">
        <input type="password" name="new_pass" placeholder="변경할 비밀번호"><br>
    </div>

    <div class="textAreaPass">
        <input type="password" name="new_check_pass" placeholder="한번 더 입력해주세요"><br>
    </div>

    <div class="btn-Update">
        <button type="submit">변경하기</button>
    </div>
</form>
</div>
</body>
</html>
