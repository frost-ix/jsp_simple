package setSend;

import java.sql.Date;

public class sendDTO{
    private String sendName;    //송금자 이름
    private String recvName;    //수신자 이름
    private int money;       //송금액
    private Date sendDate;    //송금날짜

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

public int getMoney(){
    return money;
}

public void setMoney(int money) {
    this.money = money;
}

public Date getSendDate() {
    return this.sendDate;
}

public void setSendDate(Date sendDate) {
    this.sendDate = sendDate;
}


}

