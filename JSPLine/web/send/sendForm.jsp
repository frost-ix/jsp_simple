<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>send 영역</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formManage.css">

    </head>

    <body>


        <div class="titleSend">
            <h2><%= request.getAttribute("myName")%>님의 계좌</h2>
        <br>
            <h2><%= request.getAttribute("balance")%>    잔액</h2>
        </div>

        <div class="mainSend">


        <form action="sendProcess.jsp" method="post" name="send">

            <section class="questionSend">
                 <h3>누구한테 보낼까요?</h3>
            <div class="textAreaSend">
                <input type="text" name="recvName" id="recvName" placeholder="수신자 이름" >

            </div>

            <div class="textAreaSend">
               <input type="text" name="recvAccount" id="recvAccount" placeholder="수신자 계좌번호">

            </div>

            <div class="textAreaSend">
                <input type="text" name="send_money" id="send_money" placeholder="송금할 액수 ">

            </div>

            <div class="textAreaSend">
                <input type="password" name="acc_Pwd" id="acc_Pwd" placeholder="계좌 비밀번호">

            </div>


            <div class="btn-Send">
                  <button type="submit">송금</button>
               </div>

                    <span style="color : coral; font-size: 1.2em;">
                        <%= request.getAttribute("sendError") != null ? request.getAttribute("sendError"): "" %>
                        <%= request.getAttribute("sendSuccess") != null ? request.getAttribute("sendSuccess"): "" %>
                    </span>
            </section>
            </form>
        </div>

    </body>
</html>