<%@ page import="setSend.sendDAO"%>
<%@ page import="setSend.sendDTO"%>
<%@ page import="setAccount.accountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    
    sendDAO dao = new sendDAO(application);
    sendDTO dto = new sendDTO();
    accountDTO ACCdto = new accountDTO();

    dto.setSendName((String) session.getAttribute("UserId"));
    dto.setRecvName(request.getParameter("recv_name"));
    dto.setSendMoney(request.getParameter("send_money"));
    ACCdto.setAccPwd(request.getParameter("acc_pwd"));
    
    // 계좌 존재 여부, 잔액 체크
    int checkRec = dao.RecvCheck(dto);
    int checkBalance = dao.MoneyCheck(dto);
    int checkAccpwd = dao.CheckAccountPassword(dto);

    if(checkRec == 1 && checkBalance == 1 && checkAccpwd == 1){
        //송금 수행
        int sendResult = dao.SendMoney(dto);
        int deductResult = dao.MinusMoney(dto);

        if(sendResult == 1 && deductResult== 1){

            String sendSuccess = "송금이 성공적으로 완료되었습니다.";
            request.setAttribute("sendSuccess", sendSuccess);
            response.sendRedirect("sendForm.jsp");
        }else{

            String sendError="계좌와 잔액을 다시 확인해주세요.";
            request.setAttribute("sendError", sendError);
            response.sendRedirect("sendForm.jsp");
        }
    }else{
        String sendError= "";
        if(checkRec != 1){

            sendError="존재하지 않는 계좌입니다.";

        }else if(checkBalance != 1){

            sendError="잔액이 부족합니다.";

        }else if(checkAccpwd != 1){

            sendError="계좌 비밀번호가 일치하지 않습니다.";

        }
        else {

            sendError="알 수 없는 오류가 발생했습니다.";

        }
        request.setAttribute("sendError", sendError);
        response.sendRedirect("sendForm.jsp");
    }

    
%>

