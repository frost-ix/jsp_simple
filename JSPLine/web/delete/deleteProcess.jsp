<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/29
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="crud.*" %>
<%
//    String delName = (String)session.getAttribute("UserName");
//    String delPwd = (String)session.getAttribute("UserPwd");
    String delName = request.getParameter("delName");
    String delPwd = request.getParameter("delPwd");
    String delAcc = request.getParameter("delAccntPwd");
    System.out.println(delAcc);
    int delAccntPwd = Integer.parseInt(delAcc);
//    int delAccntPwd = Integer.parseInt((String)request.getAttribute("delAccntPwd"));
    delAccntDAO dao = new delAccntDAO(application);
    int flag = dao.deleteDAO(delName, delPwd, delAccntPwd);

    if (flag > 0) {
        response.sendRedirect("../session/sessionQuit.jsp");
    }
    else {
        request.setAttribute("AccountDelErr", "탈퇴에 실패했습니다. 잔고 확인 또는 비밀번호를 해주세요!");
        request.getRequestDispatcher("delAccountForm.jsp").forward(request, response);
    }
%>