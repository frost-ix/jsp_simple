<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/06/02
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="setAccount.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("userName");
    String uid = request.getParameter("userId");
    int uPw = Integer.parseInt(request.getParameter("accntPwd"));
    accountDAO dao = new accountDAO(application);
    String searchedPwd = dao.searchPassword(name, uid, uPw);
    System.out.println(searchedPwd);

    session.setAttribute("searchedPwd",searchedPwd);
    response.sendRedirect("pwSearch.jsp");
%>
