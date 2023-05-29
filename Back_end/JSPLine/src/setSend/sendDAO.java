package setSend;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletContext;

import common.JDBConnect;
import setAccount.accountDTO;


public class sendDAO extends JDBConnect {

    accountDTO ACCdto = new accountDTO();

	public sendDAO(ServletContext application) {
		super(application);
	}
    
   // 1.  송금액, 수신자 이름, 수신자 계좌번호 정보를 입력받는 영역

    public int InputDTO(sendDTO dto){
        int result = 0;
        String query = "insert into SEND (sendname, recvname, sendmoney, senddate, account)";
        query+="values(?,?,?,?,?)";

        try {

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, dto.getSendName()); // 송금자 이름
            pstmt.setString(2, dto.getRecvName()); // 수신자 이름
            pstmt.setString(3, dto.getSendMoney()); // 송금할 금액
            
            LocalDateTime currentDateTime = LocalDateTime.now();
            String sendDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            dto.setSendDate(sendDate);

            pstmt.setString(4, sendDate);
            pstmt.setString(5, ACCdto.getAccount());
            result = pstmt.executeUpdate();
        }catch(Exception e){
            System.out.println("Exception [Get Send DTO] : " + e.getMessage());
			e.printStackTrace();
        }

        return result;
    }



    // 2. 송금가능 여부 확인 영역 ( 잔액이 충분한지 확인 )

    public boolean MoneyCheck(sendDTO dto) {

        boolean result = false;
        String accntquery = "select money from ACCNT where name=?";
        String sendquery = "select sendmoney from SEND where sendname=?";
        try {
            pstmt = con.prepareStatement(accntquery);
            pstmt.setString(1, ACCdto.getName());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                int balance = rs.getInt("money"); // balance :  송금자의 계좌 잔액
                int sendAmount =Integer.parseInt(dto.getSendMoney());  // sendAmount : 송금자가 송금할 금액

                pstmt = con.prepareStatement(sendquery);
                pstmt.setString(1, dto.getSendName());
                rs = pstmt.executeQuery();

                

                if(rs.next()) {     
                    int sendValue = rs.getInt("sendmoney"); // sendValue = 송금할 금액

                    if(balance >= sendAmount && sendValue == sendAmount){
                        result = true; //잔액이 충분하고 송금할 금액이 맞다면 송금 가능
                    }
                }
            }
        }catch(Exception e){
            System.out.println("Exception [MoneyCheck]"+e.getMessage());
            e.printStackTrace();
        }

        return result;
    }


    // 3. 송금가능 여부 확인 영역 ( 존재하는 계좌인지 확인 )
    public boolean RecvCheck(sendDTO dto) {
        boolean result = false;
        String query = "select account from ACCNT where name = ?";
        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1,ACCdto.getAccount());
            rs = pstmt.executeQuery();

            if(rs.next()){
                String accnt = rs.getString("account");
                if(accnt != null){
                    result = true;
                }
            }
            }catch(Exception e){
                System.out.println("Exception [RecvCheck]"+e.getMessage());
                 e.printStackTrace();
        }
        return result;
    }

    // 4. 송금하고 잔액에서 보낸만큼 차감하는 영역

    
    public boolean MinusMoney(sendDTO dto) {
        boolean result = false;
        String query = "update ACCNT set money = money - ? where name = ?";

        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, ACCdto.getMoney());
            pstmt.setString(2, ACCdto.getName());
            int rowsAffected = pstmt.executeUpdate();

            if( rowsAffected > 0 ) {    // 데이터베이스 업데이트가 한 개 이상 영향을 받으면 true
                result = true;
            }
        }catch(Exception e){
            System.out.println("Exception [MinusMoney]: "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    // 5. 수신자에게 송금하고 수신자에게 보낸만큼 잔액 추가하는 영역
    
    public boolean SendMoney(sendDTO dto) {
        boolean result = false;
        String query = "update ACCNT set money = money + ? where name = ?";

        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, ACCdto.getMoney());
            pstmt.setString(2, ACCdto.getName());
            int rowsAffected = pstmt.executeUpdate();

            if(rowsAffected > 0){  //데이터베이스 업데이트가 한 개 이상 영향을 받으면 true
                result = true;
            }
            
        }catch(Exception e){
            System.out.println("Exception [SendMoney] : "+ e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    // 6. 송금한 후 잔액, 송금한 금액, 수신자 이름, 보낸날짜를 저장하고 보여주는 영역

   public String[] Record(sendDTO dto) {
    String[] record = new String[4];
    String query = "select money, recvname, senddate from SEND where sendname =?";
    try{
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, dto.getSendName());
        rs = pstmt.executeQuery();

        if(rs.next()) {
            int balance = rs.getInt("money");
            String recvName = rs.getString("recvname");
            String sendDate = rs.getString("senddate");

            record[0] = Integer.toString(balance); //잔액
            record[1] = dto.getSendMoney(); // 송금한 금액
            record[2] = recvName; // 수신자
            record[3] = sendDate; //송금날짜
        }
    } catch (Exception e){
        System.out.println("Exception [Record] : "+e.getMessage());
        e.printStackTrace();
    }
    return record;
   }

   // 7. 계좌 비밀번호 확인 영역
   public boolean CheckAccountPassword(sendDTO dto){
    
    boolean result = false;
    String query = "select accpw from ACCNT where name=?";
    try{
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, ACCdto.getName());
        rs = pstmt.executeQuery();

        if(rs.next()){
            String accntpw = rs.getString("accpw");

            if(accntpw.equals(ACCdto.getAccPwd())){
                result = true;
            }
        }
    }catch(Exception e){
        System.out.println("Exception [CheckAccountPassword]: "+ e.getMessage());
        e.printStackTrace();
       }
       return result;
    }
}

    
