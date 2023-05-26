<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

    <head>
        <title>send 영역</title>
    </head>

    <body>

        <h2>send테스트</h2>
    <form action="sendProcess.jsp" method="post" name="send">
        송금할 액수 : <input type="text" name="send_money">
        수신자 계좌번호 : <input type="text" name="recv_name">
        <hr>
        <input type="submit" value="송금">
        <span style="color : coral; font-size: 1.2em;">
            <%= request.getAttribute("sendError") != null ? request.getAttribute("sendError"): "" %>
            <%= request.getAttribute("sendSuccess") != null ? request.getAttribute("sendSuccess"): "" %>
        </span>
        

    </form>
    </body>
</html>