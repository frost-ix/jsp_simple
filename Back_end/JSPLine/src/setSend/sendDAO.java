package setSend;

import common.JDBConnect;
import javax.servlet.ServletContext;

public class sendDAO extends JDBConnect {

    public sendDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	public sendDAO(ServletContext application) {
		super(application);
	}
    
   // 1.  송금액, 수신자 이름, 수신자 계좌번호 정보를 입력받는 영역

    public void InputDTO(sendDTO dto){

        String query = "insert into SEND (sendname, recvname, money, senddate)";
        query+="values(?,?,?,?)"
        try {

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, dto.getSendName()); // 송금자 이름
            pstmt.setString(2, dto.getRecvName()); // 수신자 이름
            pstmt.setString(3, dto.getMONEY()); // 송금할 금액
            pstmt.setString(4, dto.setSendDate());  //송금한 날짜
            int sendResult = pstmt.executeUpdate();
            
        }catch(Exception e){
            System.out.println("Exception [Get Send DTO] : " + e.getMessage());
			e.printStackTrace();
        }

        return sendResult;
    }



    // 2. 송금가능 여부 확인 영역 ( 액수가 충분한지 확인)

    public boolean MoneyCheck(sendDTO dto) {
        String query = "select money from SEND where sendname=?"
        try {
            pstmt.con.prepareStatement(query);
            pstmt.setString(1,dto.getSendName());
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                int balance = rs.getInt("money"); // balance :  송금자의 계좌 잔액
                int SendAmount = Integer.parseInt(dto.getMoney());  // trnasferAmount : 송금자가 송금할 금액

                if(balance >= transferAmount) {     
                    return true;    // 잔액이 송금할 금액보다 높다면 송금 가능
                }
            }
        }catch(Exception e){
            System.out.println("Exception [MoneyCheck]"+e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    // 3. 송금가능 여부 확인 영역 ( 존재하는 대상인지 확인 )
    public boolean RecvCheck(sendDTO dto) {
        
        String query = "select "
        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getRecvName());
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){
                int count = rs.getInt("count");
                if(count > 0){
                    return true;
                }
            }catch(Exception e){
                System.out.println("Exception [RecvCheck]"+e.getMessage());
                 e.printStackTrace();
            }
        }
        return false;
    }
    

    // 4. 송금했을 때 잔액에서 보낸만큼 차감하는 영역

    public void UseMoney(sendDTO dto) {
        
        String query = "update SEND set money - ? where sendname = ? ";
        try{
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getMoney());
            pstmt.setString(2, dto.getSendName());
            int result = pstmt.executeQuery();

            if(result > 0) {
                System.out.println("송금완료")
            }
        }
    }
}

    
