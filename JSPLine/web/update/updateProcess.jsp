<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/24
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="setAccount.*" %>
<%@ page import="crud.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ID = (String)session.getAttribute("UserId");
    String oldPwd = request.getParameter("old_pass");
    String newPwd = request.getParameter("new_pass");
    String checkNewPwd = request.getParameter("new_check_pass");
    System.out.println(ID+" : "+oldPwd +" : "+newPwd+" : "+checkNewPwd);
accountDAO accntDAO = new accountDAO(application);
accountDTO dto = accntDAO.getAccountPw(ID, oldPwd);
upAccntDAO upDAO = new upAccntDAO(application);


if (oldPwd.equals(dto.getPwd())) {
    if (newPwd.equals(checkNewPwd )) {
        int result = upDAO.updateAccountPwd(ID, newPwd);
        session.setAttribute("UserPwd", newPwd);
        System.out.println(result);
        response.sendRedirect("../session/LoginForm.jsp");
    }
    else {
        request.setAttribute("CreateError", "변경할  비밀번호와 한번 더 입력한 비밀번호가 불일치 합니다..");
        request.getRequestDispatcher("updatePass.jsp").forward(request, response);
    }
}
else {
    request.setAttribute("CreateError", "사용중인 비밀번호가 입력된 비밀번호와 다릅니다.");
    request.getRequestDispatcher("updatePass.jsp").forward(request, response);
}

%>
