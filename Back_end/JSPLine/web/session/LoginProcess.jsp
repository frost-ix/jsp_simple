<%@ page import="setAccount.accountDTO"%>
<%@ page import="setAccount.accountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userID = request.getParameter("user_id");
	String userPW = request.getParameter("user_pw");
	
//    String oracleDriver = application.getInitParameter("OracleDriver");
//    String oracleURL = application.getInitParameter("OracleURL");
//    String oracleID = application.getInitParameter("OracleID");
//    String oraclePwd = application.getInitParameter("OraclePwd");

    accountDAO dao = new accountDAO(application);
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
			request.setAttribute("LoginErrMsg", "패스워드가 입력되지 않았습니다.");
			response.sendRedirect("LoginForm.jsp");
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
			request.setAttribute("LoginErrMsg", "아이디 또는 패스워드가 입력되지 않았습니다.");
			response.sendRedirect("LoginForm.jsp");
			break;
		}
	}
%>