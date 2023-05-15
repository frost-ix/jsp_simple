<%@ page import="~~.accountDTO"%>
<%@ page import="~~.accountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>

<%
	String userID = request.getParameter("user_id");
	String userPW = request.getParameter("user_pw");
	
    String oracleDriver = application.getInitParameter("OracleDriver");
    String oracleURL = application.getInitParameter("OracleURL");
    String oracleID = application.getInitParameter("OracleID");
    String oraclePwd = application.getInitParameter("OraclePwd");

    MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleID, oraclePwd);
    MemberDTO memberDTO = dao.getMemberDTO(userID, userPWD);
    dao.close();

	boolean isNotnull_Id = (accountDTO.getId() != null) == true;
	boolean isNotnull_Pw = (accountDTO.getPw() != null) == true;

    if (isNotnull_Id) {
		if (isNotnull_Pw) {
			session.setAttribute("UserId", accountDTO.getId());
        	session.setAttribute("UserName", accountDTO.getName());
        	response.sendRedirect("LoginForm.jsp");
		}
		else {
			request.setAttribute("LoginErrMsg", "패스워드가 입력되지 않았습니다.");
			response.sendRedirect("LoginForm.jsp");
		}
    }
    else {
        request.setAttribute("LoginErrMsg", "아이디 또는 패스워드가 입력되지 않았습니다.");
		response.sendRedirect("LoginForm.jsp");
    }
%>