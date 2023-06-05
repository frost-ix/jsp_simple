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
    <title>개인정보</title>
    <link rel="stylesheet" href="../css/formManage.css">
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="d-flex flex-row" id="wrapper">
    <jsp:include page="${pageContext.request.contextPath}../sideBar.jsp"/>
    <div id="page-content-wrapper">
        <jsp:include page="${pageContext.request.contextPath}../topNav.jsp"/>
            <div class="infoView d-flex flex-column bd-highlight mb-3">
                <form action="">
                    <div class="Info_title">
                        <h1>나의 정보</h1>
                    </div>

                    <div class="My_Info">
                        <div class="Info">이름 :    <%=session.getAttribute("UserName")%></div><br><br>
                        <div class="Info">아이디 :   <%=session.getAttribute("UserId")%></div><br><br>
                        <div class="Info">계좌번호 :   <%=session.getAttribute("UserAccount")%></div><br><br>
                        <div class="Info">잔액 :    <%=session.getAttribute("UserMoney")%></div><br>
                    </div>
                </form>
            </div>
    </div>
</div>
<jsp:include page="${pageContext.request.contextPath}../core.jsp"/>
</body>
</html>
