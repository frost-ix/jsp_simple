<%@ page import="setSend.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    
    sendDAO dao = new sendDAO(application);
    sendDTO dto = new sendDTO();

    dto.setSendName((String) session.getAttribute("UserId"));
    dto.setRecvName(request.getParameter("recv_name"));
    dto.setSendMoney(request.getParameter("send_money"));
    
    // 계좌 존재 여부, 잔액 체크
    boolean checkRec = dao.RecvCheck(dto);
    boolean checkBalance = dao.MoneyCheck(dto);

    if(checkRec && checkBalance){
        //송금 수행
        boolean moneySent = dao.SendMoney(dto);
        boolean moneyDeducted = dao.MinusMoney(dto);

        String sendSuccess = "송금이 성공적으로 완료되었습니다.";
        System.out.println(" " + sendSuccess + " ");

       
    } else if(!checkRec){

        String sendError = "존재하지 않는 계좌입니다.";
        System.out.println("" + sendError + "");

    }
    else if(!checkBalance){
        
        String sendError = "잔액이 부족합니다.";
        System.out.println("" + sendError + "");
        
    }

    
%>
