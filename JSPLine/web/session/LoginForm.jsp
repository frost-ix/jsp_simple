<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/18
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>get DB test</title>
</head>
<body>
<jsp:include page="../common/Link.jsp"/>
<span style="color: coral; font-size: 1.2em;">
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
<%
    if(session.getAttribute("UserId") == null) {
%>
<script>
    function validateForm(form) {
        if (!form.id.value || !form.pw.value) {
            alert("아이디 또는 비밀번호가 비어있습니다.");
            return false;
        }
        else if (form.id.value && !form.pw.value) {
            alert("비밀번호가 비어있습니다.");
            return false;
        }
    }
</script>
<h1>Test page......</h1>
    <form action="LoginProcess.jsp" method="post" name="loginForm" onsubmit="return validateForm(this);">
        ID : <input type="text" name="id"><br>
        PW : <input type="password" name="pw"><br>
        <input type="submit" value="보내기">
    </form>
<% }
    else{
%>
<h1>로그인 성공</h1>
User name : <%=session.getAttribute("UserName")%><br>
ID : <%=session.getAttribute("UserId")%><br>
Password : <%=session.getAttribute("UserPwd")%><br>
Account Password : <%=session.getAttribute("UserAccPwd")%><br>
Account : <%=session.getAttribute("UserAccount")%><br>
Money : <%=session.getAttribute("UserMoney")%><br>
Flag Point : <%=session.getAttribute("Flag")%><br>
<%
    }
%>

</body>
</html>
