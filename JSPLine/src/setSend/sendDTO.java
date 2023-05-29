package setSend;

public class sendDTO{
    private String sendName;    //송금자 이름
    private String recvName;    //수신자 이름
    private String sendmoney;       //송금액
    private String sendDate;    //송금날짜

public String getSendName() {
    return sendName;
}

public void setSendName(String sendName) {
    this.sendName = sendName;
}

public String getRecvName(){
    return recvName;
}

public void setRecvName(String recvName) {
    this.recvName = recvName;
}

public String getSendMoney(){
    return sendmoney;
}

public void setSendMoney(String sendmoney) {
    this.sendmoney = sendmoney;
}

public String getSendDate() {
    return this.sendDate;
}

public void setSendDate(String sendDate) {
    this.sendDate = sendDate;
}


}

