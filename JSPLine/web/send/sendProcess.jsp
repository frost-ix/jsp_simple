<%@ page import="setSend.*"%>
<%@ page import="setAccount.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 계좌 비밀번호 일치 확인
    int sessionPwd = (int)(session.getAttribute("UserAccPwd"));
    int myAccPwd = Integer.parseInt(request.getParameter("acc_Pwd"));
    boolean IsPasswordSame = sessionPwd == myAccPwd;
    System.out.println(sessionPwd + " : " + myAccPwd + " : " + IsPasswordSame);

    // 잔액이 충분한지 확인
    int balance = (int)(session.getAttribute("UserMoney"));
    int sendMoney = Integer.parseInt(request.getParameter("send_money"));
    boolean EnoughMoney = balance >= sendMoney;
    System.out.println(balance + " : " + sendMoney + " : " + EnoughMoney);

    // 수신자가 존재하는지 확인
    String myName = (String)session.getAttribute("UserName");
//    String myAccount = (String)session.getAttribute("UserAccount");
    String recvName = request.getParameter("recvName");
    String recvAccnt = request.getParameter("recvAccount");
    System.out.println(myName + " : " + recvName + " : "+ recvAccnt);

    accountDAO recvDAO = new accountDAO(application);
    accountDTO recvDTO = recvDAO.getRecvInfo(recvName, recvAccnt);
    System.out.println(recvDTO.getName() + " : " + recvDTO.getAccount());
    recvDAO.close();

    if (recvDTO.getName() == null && recvDTO.getAccount() == null) {
        request.setAttribute("sendError", "없는 사용자 입니다.");
        request.getRequestDispatcher("sendForm.jsp").forward(request, response);
    }
    boolean RecvAccountCheck = (recvDTO.getAccount().equals(recvAccnt));

    sendDAO sendDao = new sendDAO(application);
    int sendResults = sendDao.InputDTO(myName, recvName, sendMoney);

    // 계좌 존재 여부, 잔액 체크
//    boolean check = sendDao.check(myName, myAccount, send_money);
//    boolean checkRec = sendDao.RecvAccountCheck(myName, myAccount);
//    boolean checkAccpwd = sendDao.CheckAccountPassword(myName, myAccPwd);

// IsPasswordSame : 계좌비밀번호일치 / EnoughMoney : 잔액충분 / RecvAccountCheck : 사용자와 계좌 존재
// 3개 모두 True : 송금 수행
    if (IsPasswordSame && EnoughMoney && RecvAccountCheck) {
        if(sendResults > 0){     // 송금이 성공적으로 수행됐다면
            sendDao.SendMoney(sendMoney,recvName);
            sendDao.MinusMoney(sendMoney,myName);
            request.setAttribute("sendSuccess", "송금이 성공적으로 완료되었습니다.");
            response.sendRedirect("sendForm.jsp");
        }
    }
    else{                             // 송금에 실패했다면
        String sendError = "";
        if(!RecvAccountCheck){
            sendError += "존재하지 않는 계좌입니다. \n";
        }
        if(!IsPasswordSame) {
            sendError += "계좌 비밀번호가 일치하지 않습니다.\n";
        }
        if(!EnoughMoney){
            sendError += "잔액이 부족합니다.\n";
        }
        else {
            sendError="알 수 없는 오류가 발생했습니다.\n";
        }
        request.setAttribute("sendError", sendError);
        request.getRequestDispatcher("sendForm.jsp").forward(request, response);
    }
%>

