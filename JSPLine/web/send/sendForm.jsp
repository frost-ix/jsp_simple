<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>send 영역</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sendForm.css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="d-flex" id="wrapper">
    <jsp:include page="${pageContext.request.contextPath}../sideBar.jsp"/>
    <div id="page-content-wrapper">
        <jsp:include page="${pageContext.request.contextPath}../topNav.jsp"/>
        <div class="sendView d-flex flex-column bd-highlight mb-3" style="margin-top:3%">
            <div class="p-2 bd-highlight titleSend">
                <h2><%= session.getAttribute("UserName")%>님의 계좌</h2>
                <br>
                <h2><%= session.getAttribute("Money")%>    잔액</h2>
            </div>

            <div class="p-2 bd-highlight mainSend">
                <form action="sendProcess.jsp" method="post" name="send">
                    <section class="questionSend">
                        <h3>누구한테 보낼까요?</h3>
                        <div class="textAreaSend">
                            <input type="text" name="recvName" id="recvName" placeholder="수신자 이름">

                        </div>

                        <div class="textAreaSend">
                            <input type="text" name="recvAccount" id="recvAccount" placeholder="수신자 계좌번호">

                        </div>

                        <div class="textAreaSend">
                            <input type="text" name="sendMoney" id="send_money" placeholder="송금할 액수 ">

                        </div>

                        <div class="textAreaSend">
                            <input type="password" name="accPwd" id="acc_Pwd" placeholder="계좌 비밀번호">

                        </div>


                        <div class="btn-Send">
                            <button type="submit">송금</button>
                        </div>

                        <span style="color : coral; font-size: 1.2em;">
                        <%= request.getAttribute("sendError") != null ? request.getAttribute("sendError") : "" %>
                        <%= request.getAttribute("sendSuccess") != null ? request.getAttribute("sendSuccess") : "" %>
                    </span>
                    </section>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="${pageContext.request.contextPath}../core.jsp"/>
</body>
</html>