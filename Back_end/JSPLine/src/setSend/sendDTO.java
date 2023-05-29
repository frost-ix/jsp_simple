package setSend;
import setAcccount.accountDTO;

public class sendDTO{

    private String sendname;    //송금자 이름    
    private String recvname;    //수신자 이름
    private String sendmoney;       //송금액
    private String sendDate;    //송금날짜

public String getSendName() {
    return sendname;
}

public void setSendName(String sendname) {
    this.sendname = sendname;
}

public String getRecvName(){
    return recvname;
}

public void setRecvName(String recvname) {
    this.recvname = recvname;
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

