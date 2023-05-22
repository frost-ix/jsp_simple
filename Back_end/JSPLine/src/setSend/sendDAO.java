package setSend;

import common.JDBConnect;
import javax.servlet.ServletContext;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class sendDAO extends JDBConnect {
	public sendDAO(ServletContext application) {
		super(application);
	}
    
   // 1.  송금액, 수신자 이름, 수신자 계좌번호 정보를 입력받는 영역

    public int InputDTO(sendDTO dto){
        int result = 0;
        String query = "insert into SEND (sendname, recvname, money, senddate)";
        query+="values(?,?,?,?)";
        try {

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, dto.getSendName()); // 송금자 이름
            pstmt.setString(2, dto.getRecvName()); // 수신자 이름
            pstmt.setString(3, dto.getMoney()); // 송금할 금액
            
            LocalDateTime currentDateTime = LocalDateTime.now();
            String sendDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            dto.setSendDate(sendDate);

            pstmt.setString(4, sendDate);
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
        String query = "select money from SEND where sendname=?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getSendName());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                int balance = rs.getInt("money"); // balance :  송금자의 계좌 잔액
                int sendAmount = Integer.parseInt(dto.getMoney());  // sendAmount : 송금자가 송금할 금액

                if(balance >= sendAmount) {     
                    result = true;    // 잔액이 송금할 금액보다 많다면 송금 가능
                }
            }
        }catch(Exception e){
            System.out.println("Exception [MoneyCheck]"+e.getMessage());
            e.printStackTrace();
        }

        return result;
    }


    // 3. 송금가능 여부 확인 영역 ( 존재하는 대상인지 확인 )
    public boolean RecvCheck(sendDTO dto) {
        boolean result = false;
        String query = "select recvname from SEND where recvname = ?";
        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getRecvName());
            rs = pstmt.executeQuery();

            if(rs.next()){
                String receiver = rs.getString("recvname");
                if(receiver != null){
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
        String query = "update send set money = money - ? where sendname = ?";

        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getMoney());
            pstmt.setString(2, dto.getSendName());
            int rowsAffected = pstmt.executeUpdate();

            if(rowsAffected == 1 ) {    // 송금액이 정확히 한 번 차감되었는지 확인
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
        String query = "update SEND set money = money + ? where recvname = ?";

        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getMoney());
            pstmt.setString(2, dto.getRecvName());
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
            record[1] = dto.getMoney(); // 송금한 금액
            record[2] = recvName; // 수신자
            record[3] = sendDate; //송금날짜
        }
    } catch (Exception e){
        System.out.println("Exception [Record] : "+e.getMessage());
        e.printStackTrace();
    }
    return record;
   }
}

    
