<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>send 영역</title>
        <link rel="stylesheet" href="sendForm.css">

<%--        <link rel="stylesheet" href="./sendForm.css">--%>
    </head>

    <body>


        <div class="title">
            <h2><%= request.getAttribute("myName")%>님의 계좌</h2>
        <br>
            <h2><%= request.getAttribute("balance")%>    잔액</h2>
        </div>

        <div class="main">


        <form action="sendProcess.jsp" method="post" name="send">

            <div class="textArea">
                <input type="text" name="recvName" id="recvName">
                <label for="recvName">수신자 이름</label>
            </div>

            <div class="textArea">
               <input type="text" name="recvAccount" id="recvAccount">
                <label for="recvAccount">수신자 계좌번호</label>
            </div>

            <div class="textArea">
                <input type="text" name="send_money" id="send_money">
                <label for="send_money">송금할 액수</label>
            </div>

            <div class="textArea">
                <input type="password" name="acc_Pwd" id="acc_Pwd">
                <label for="acc_Pwd">계좌 비밀번호</label>
            </div>

               <div class="btn-area">
                  <button type="submit">송금</button>
               </div>

                    <span style="color : coral; font-size: 1.2em;">
                        <%= request.getAttribute("sendError") != null ? request.getAttribute("sendError"): "" %>
                        <%= request.getAttribute("sendSuccess") != null ? request.getAttribute("sendSuccess"): "" %>
                    </span>
            </form>
        </div>
    </body>
</html>