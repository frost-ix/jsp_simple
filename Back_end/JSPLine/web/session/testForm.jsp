<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/19
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("LoginForm.jsp");
%>
