<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>send 영역</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<%--        <link rel="stylesheet" href="./sendForm.css">--%>
    </head>

    <body>
        <div class="title">
            <h2>send테스트</h2><br>
            <h2>계좌번호</h2><br>
            <h2>잔고</h2>
        </div>
        
        <div class="main">

        <h2>send 테스트</h2>
        <form action="sendProcess.jsp" method="post" name="send">
                수신자 이름 : <input type="text" name="recvName"><br><br>
                수신자 계좌번호 : <input type="text" name="recvAccount"><br><br>
                송금할 액수 : <input type="text" name="sendMoney"><br><br>
                계좌 비밀번호 : <input type="password" name="accPwd"><hr>

                <div class="row">
                    <div class="col">
                        <input type="submit" class="form-control  border border-secondary myBtn1" aria-label="input button" value="송금">
                    </div>
                    <span style="color : coral; font-size: 1.2em;">
                        <%= request.getAttribute("sendError") != null ? request.getAttribute("sendError"): "" %>
                        <%= request.getAttribute("sendSuccess") != null ? request.getAttribute("sendSuccess"): "" %>
                    </span>
                </div>
            </form>
        </div>
    </body>
</html>