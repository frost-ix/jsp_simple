<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/06/03
  Time: 3:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="crud.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int randNumFir = (int)(Math.random() * 9 + 1);
    int randNumSec = (int)(Math.random() * 9 + 1);
    session.setAttribute("randomFirst", randNumFir);
    session.setAttribute("randomSecond", randNumSec);
    int count = Integer.parseInt((String)session.getAttribute("count"));
    if (count < 6) {
        count ++;
        System.out.println(pageContext.getAttribute("count"));
        pageContext.setAttribute("count", count);
        response.sendRedirect("playForm.jsp");
    }
    else {
        request.setAttribute("gameOver", "횟수가 전부 소진 되었습니다");
        request.getRequestDispatcher("playForm.jsp").forward(request, response);
    }
%>
