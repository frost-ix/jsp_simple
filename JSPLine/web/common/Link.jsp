<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/22
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table border="1" width="80%">
    <tr>
        <td align="center">
            <% if(session.getAttribute("UserId") == null) { %>
            <a href="../session/LoginForm.jsp">Login</a>
            <% } else { %>
            <a href="../session/sessionQuit.jsp">Logout</a> &nbsp;&nbsp;
            <a href="../update/updatePass.jsp">Change Password</a> &nbsp;&nbsp;
            <a href="../delete/delAccountForm.jsp">Delete Account</a> &nbsp;&nbsp;
            <% } %>
        </td>
    </tr>
</table>