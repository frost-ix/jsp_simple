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
    <title>탈퇴</title>
    <link rel="stylesheet" href="../css/formManage.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="d-flex" id="wrapper">
    <jsp:include page="${pageContext.request.contextPath}../sideBar.jsp"/>
    <div id="page-content-wrapper">
        <jsp:include page="${pageContext.request.contextPath}../topNav.jsp"/>
            <div class="deleteView d-flex flex-column bd-highlight mb-3" style="margin-top:3%">
                <div class="titleDel p-2 bd-highlight">
                    <h3>정말로 탈퇴 하시겠습니까?</h3>
                    탈퇴를 하시려면 본인 이름과 계좌 비밀번호를 입력해주세요 <br>
                    <span style="color: chocolate; font-size: 1.2em;">
                            <%= request.getAttribute("AccountDelErr") == null ? "" : request.getAttribute("AccountDelErr") %>
                    </span>
                </div>

                <div class="mainDel p-2 bd-highlight">
                    <form action="deleteProcess.jsp" method="post" name="deleteForm">

                        <div class="textAreaDel">
                            <input type="text" name="delName" placeholder="본인 이름"> <br>
                        </div>

                        <div class="textAreaDel">
                            <input type="password" name="delPwd" placeholder="계정 비밀번호"> <br>
                        </div>

                        <div class="textAreaDel">
                             <input type="password" name="delAccntPwd" placeholder="계좌 비밀번호"> <br>
                        </div>

                        <div class="btn-del">
                             <button type="submit">탈퇴하기</button>
                        </div>
                    </form>
                </div>
            </div>
    </div>
</div>
</body>
</html>
