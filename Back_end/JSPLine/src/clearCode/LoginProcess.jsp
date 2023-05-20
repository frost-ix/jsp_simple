<%@ page import="membership.accountDTO"%>
<%@ page import="membership.accountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 폼으로부터 받은 아이디와 패스워드
	String userId = request.getParameter("id");
	String userPwd = request.getParameter("pw");
	
	// web.xml에서 가져온 데이터베이스 연결 정보
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	// 회원 테이블 DAO를 통해 회원 정보 DTO 획득 
	accountDAO dao = new accountDAO(oracleDriver,oracleURL,oracleId,oraclePwd);
	accountDTO dto = dao.getaccountDTO(userId, userPwd);
	dao.close();
	
	// 로그인 성공 여부에 따른 처리
	boolean isNotnull_Id = (dto.getId() != null) == true;
	boolean isNotnull_Pw = (dto.getPwd() != null) == true;

    if (isNotnull_Id) {
			if (isNotnull_Pw) {
			session.setAttribute("UserId", dto.getId());
        	session.setAttribute("UserName", dto.getName());
        	// go to testView.jsp
        	response.sendRedirect("testView.jsp");
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







