<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/23
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="crud.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String crtName = request.getParameter("signName");
    String crtId = request.getParameter("signId");
    String crtPw = request.getParameter("signPw");
    int crtAccntPw;
    if (request.getParameter("signAccntPw").equals("")) {
        crtAccntPw = 0;
    }
    else {
        crtAccntPw = Integer.parseInt(request.getParameter("signAccntPw"));
    }

    String account = "110";
    for (int i = 0; i < 9; i++) {
        int accnt = (int)(Math.random() * 9) + 1;
        account += String.valueOf(accnt);
    }

    boolean isNotNull = !crtName.isEmpty() && !crtId.isEmpty() && !crtPw.isEmpty();
    boolean isNotZero = crtAccntPw != 0;

    if ((isNotNull && isNotZero)) {
        crtAccntDAO crtDAO = new crtAccntDAO(application);
        int result = crtDAO.createDTO(crtName, crtId, crtPw, crtAccntPw, account);
        if (result > 0) {
            session.setAttribute("createFlag", 2);
            request.setAttribute("CreateCheck", "생성 완료");
            response.sendRedirect("crtAccnt.jsp");
        }
        else {
            session.setAttribute("createFlag", 1);
            request.setAttribute("CreateError", "이미 존재하는 사용자 입니다.");
            request.getRequestDispatcher("crtAccnt.jsp").forward(request, response);
        }
    }
    else {
        session.setAttribute("createFlag", 0);
        request.setAttribute("CreateError", "입력 안된 공간이 있거나, 잘못 입력 되었습니다.");
        request.getRequestDispatcher("crtAccnt.jsp").forward(request, response);
    }

%>