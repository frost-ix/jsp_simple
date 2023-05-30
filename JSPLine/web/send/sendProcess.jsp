<%@ page import="setSend.*"%>
<%@ page import="setAccount.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String myName = (String)session.getAttribute("UserName");
    int sessionPwd = Integer.parseInt((String)session.getAttribute("UserAccPwd"));
    int myAccPwd = Integer.parseInt(request.getParameter("accntPwd"));
    String myAccount = (String)session.getAttribute("UserAccount");
    String sendValue = request.getParameter("send_money");

    String recvName = request.getParameter("recvName");
    int recvAccnt = Integer.parseInt(request.getParameter("recvAccnt"));

    boolean IsPasswordSame = sessionPwd == myAccPwd;

    accountDAO recvDAO = new accountDAO(application);
    accountDTO recvDTO = recvDAO.getRecvInfo(recvName, recvAccnt);
    recvDAO.close();

    sendDAO dao = new sendDAO(application);
    sendDTO dto = new sendDTO();

    // 계좌 존재 여부, 잔액 체크
//    boolean check = dao.check(myName, myAccount, send_money);
//    boolean checkRec = dao.RecvCheck(myName, myAccount);
//    boolean checkAccpwd = dao.CheckAccountPassword(myName, myAccPwd);


    if(checkRec == 1 && check == 1 && checkAccpwd == 1){
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

