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
    out.println("<script>");
    if (searchedPwd != null) {
        out.println("alert('"+searchedPwd+"+.');");
        out.println("</script>");
        session.setAttribute("searchedPwd",searchedPwd);
        response.sendRedirect("../index.jsp");
    }
    else {
        out.println("alert('패스워드 탐색에 실패하였습니다.');");
        out.println("</script>");
        response.sendRedirect("../index.jsp");
    }
%>
