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
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="../css/formManage.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<span style="color: coral; font-size: 1.2em;">
        <%= request.getAttribute("CreateError") == null ? "" : request.getAttribute("CreateError") %>
    </span>

<div class="d-flex" id="wrapper">
    <jsp:include page="${pageContext.request.contextPath}../sideBar.jsp"/>
    <div id="page-content-wrapper">
        <jsp:include page="${pageContext.request.contextPath}../topNav.jsp"/>
        <div class="main_Update d-flex flex-column bd-highlight mb-3">
            <form action="updateProcess.jsp" method="post" name="update" style="margin-top:3%">
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
    </div>
</div>
</body>
</html>
