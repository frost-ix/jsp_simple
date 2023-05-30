<%@ page import="setSend.*"%>
<%@ page import="setAccount.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 계좌 비밀번호 일치 확인
    int sessionPwd = Integer.parseInt((String)session.getAttribute("UserAccPwd"));
    int myAccPwd = Integer.parseInt(request.getParameter("acc_Pwd"));
    boolean IsPasswordSame = sessionPwd == myAccPwd;

    // 잔액이 충분한지 확인
    int balance = Integer.parseInt((String)session.getAttribute("UserMoney"));
    int sendMoney = Integer.parseInt(request.getParameter("send_money"));
    boolean EnoughMoney = balance >= sendMoney;

    // 수신자가 존재하는지 확인
    String myName = (String)session.getAttribute("UserName");
    String myAccount = (String)session.getAttribute("UserAccount");
    String recvName = request.getParameter("recv_name");
    int recvAccnt = Integer.parseInt(request.getParameter("recv_accnt"));
    accountDAO recvDAO = new accountDAO(application);
    accountDTO recvDTO = recvDAO.getRecvInfo(recvName, recvAccnt);
    recvDAO.close();
    boolean RecvCheck = (recvDTO != null) ;


    sendDAO dao = new sendDAO(application);
    sendDTO dto = new sendDTO();

    // 계좌 존재 여부, 잔액 체크
//    boolean check = dao.check(myName, myAccount, send_money);
//    boolean checkRec = dao.RecvCheck(myName, myAccount);
//    boolean checkAccpwd = dao.CheckAccountPassword(myName, myAccPwd);


    if(IsPasswordSame && EnoughMoney && RecvCheck ){
        // IsPasswordSame : 계좌비밀번호일치 / EnoughMoney : 잔액충분 / RecvCheck : 사용자와 계좌 존재

        // 3개 모두 True : 송금 수행
        boolean sendResult = dao.SendMoney(sendMoney,recvName);
        boolean deductResult = dao.MinusMoney(sendMoney,myName);

        if(sendResult && deductResult){     // 송금이 성공적으로 수행됐다면

            String sendSuccess = "송금이 성공적으로 완료되었습니다.";
            request.setAttribute("sendSuccess", sendSuccess);
            response.sendRedirect("sendForm.jsp");

        }else{                             // 송금에 실패했다면
                String sendError= "";
            if(!IsPasswordSame) {

                sendError = "계좌 비밀번호가 일치하지 않습니다.";

            }else if(!EnoughMoney){

                sendError="잔액이 부족합니다.";

            } else if(!RecvCheck){

                    sendError="존재하지 않는 계좌입니다.";

                }else {

                    sendError="알 수 없는 오류가 발생했습니다.";

                }
                request.setAttribute("sendError", sendError);
                response.sendRedirect("sendForm.jsp");
        }

    }

    
%>

