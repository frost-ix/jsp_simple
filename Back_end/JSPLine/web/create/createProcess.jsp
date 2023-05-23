<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/23
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="createAccount.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String crtName = request.getParameter("sign_name");
    String crtId = request.getParameter("sign_id");
    String crtPw = request.getParameter("sign_pw");
    String crtAccntPw = request.getParameter("sign_AccntPw");

    String account = "110";
    for (int i = 0; i < 9; i++) {
        int accnt = (int)(Math.random() * 9) + 1;
        account += String.valueOf(accnt);
    }

    crtAccntDAO dao = new crtAccntDAO(application);
    int result = dao.createDTO(crtName, crtId, crtPw, crtAccntPw, account);
    if (result > 0) {
        response.sendRedirect("crtAccnt.jsp");
    }
    else {
        request.setAttribute("CreateError", "이미 존재하는 사용자 입니다.");
        request.getRequestDispatcher("crtAccnt.jsp").forward(request, response);
    }

%>