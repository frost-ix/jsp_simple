package setSend;

public class sendDTO{

    private String sendname;    //송금자 이름    
    private String recvname;    //수신자 이름
    private String money;       //잔액
    private String senddate;    //송금날짜
    
}

public static String getSendName() {
    return sendname;
}

public void setSendName(String sendname) {
    sendDTO.sendname = sendname;
}

public static String getRecvName(){
    return recvname;
}

public void setRecvName(String recvname) {
    sendDTO.recvname = recvname;
}

public static String getMoney(){
    return money;
}

public void setMoney() {
    sendDTO.money = money;
}

public static String getSendDate() {
    return senddate;
}

public void setSendDate() {
    sendDTO.senddate = senddate;
}