<%@ page import="setAccount.accountDTO"%>
<%@ page import="setAccount.accountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userID = request.getParameter("id");
	String userPW = request.getParameter("pw");
	System.out.println(userID + " : " + userPW);

    accountDAO dao = new accountDAO(application);
    accountDTO dto = dao.getAccountDTO(userID, userPW);
    dao.close();

	int flagPoint = 0;

	session.setAttribute("Flag", flagPoint);

	boolean isNotnull_Id = dto.getId() != null;
	boolean isNotnull_Pw = dto.getPwd() != null;

    if (isNotnull_Id && dto.getId().equals(userID)) {
		if (isNotnull_Pw && dto.getPwd().equals(userPW)) {
			flagPoint = 2;
		}
		else if (isNotnull_Pw && !dto.getPwd().equals(userPW)) {
			flagPoint = 1;
		}
    }

	System.out.println(flagPoint);

	switch (flagPoint) {
		case 1: {
			request.setAttribute("LoginErrMsg", "패스워드가 일치하지 않습니다.");
			request.getRequestDispatcher("./../index.jsp").forward(request, response);
			break;
		}
		case 2: {
			session.setAttribute("UserName", dto.getName());
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserPwd", dto.getPwd());
			session.setAttribute("UserAccPwd", dto.getAccPwd());
			session.setAttribute("UserAccount", dto.getAccount());
			session.setAttribute("UserMoney", dto.getMoney());
			session.setAttribute("Flag", flagPoint);
//			Send to main page
			response.sendRedirect("./../main.jsp");
			break;
		}
		default: {
			request.setAttribute("LoginErrMsg", "아이디또는 패스워드가 존재하지 않습니다.");
			request.getRequestDispatcher("./../index.jsp").forward(request, response);
			break;
		}
	}
%>