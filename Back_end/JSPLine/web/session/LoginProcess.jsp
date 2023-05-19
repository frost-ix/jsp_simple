<%@ page import="setAccount.accountDTO"%>
<%@ page import="setAccount.accountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userID = request.getParameter("id");
	String userPW = request.getParameter("pw");
	
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleID = application.getInitParameter("OracleID");
    String oraclePwd = application.getInitParameter("OraclePwd");

    accountDAO dao = new accountDAO(oracleDriver, oracleURL, oracleID, oraclePwd);
    accountDTO accountDTO = dao.getAccountDTO(userID, userPW);
    dao.close();

	int flagPoint = 0;

	boolean isNotnull_Id = (accountDTO.getId() != null);
	boolean isNotnull_Pw = (accountDTO.getPwd() != null);

    if (isNotnull_Id) {
		if (isNotnull_Pw) {
			flagPoint = 2;
		}
		else {
			flagPoint = 1;
		}
    }

	switch (flagPoint) {
		case 1: {
			request.setAttribute("LoginErrMsg", "패스워드가 일치하지 않습니다.");
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			break;
		}
		case 2: {
			session.setAttribute("UserId", accountDTO.getId());
			session.setAttribute("UserName", accountDTO.getName());
//			Send to main page
			response.sendRedirect("LoginForm.jsp");
			break;
		}
		default: {
			request.setAttribute("LoginErrMsg", "아이디와 패스워드가 일치하지 않습니다.");
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			break;
		}
	}
%>