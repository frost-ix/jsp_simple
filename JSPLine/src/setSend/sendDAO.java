package setSend;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class sendDAO extends JDBConnect {
    public sendDAO(ServletContext application) {
        super(application);
    }

    // 1.  송금액, 수신자 이름, 수신자 계좌번호 정보를 입력받는 영역
    public int InputDTO(String sendName, String recvName, int money) {
        int result = 0;
        String query = "insert into SEND (SENDNAME, RECVNAME, MONEY, SENDDATE) values(?,?,?,?)";

        try {
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, sendName); // 송금자 이름
            pstmt.setString(2, recvName); // 수신자 이름
            pstmt.setInt(3, money); // 송금할 금액

            LocalDateTime currentDateTime = LocalDateTime.now();
            String sendDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            java.util.Date realTime = new java.util.Date();
            Date sqlDate = new Date(realTime.getTime());

            System.out.println(currentDateTime + " : " + sendDate + " : " + sqlDate);
            System.out.println(currentDateTime.getClass().getName() + " : " + sendDate.getClass().getName() + " : " + sqlDate.getClass().getName());

            pstmt.setDate(4, sqlDate);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception [Get Send DTO] : " + e.getMessage());
            e.printStackTrace();
        }

        return result;
    }
    public void sendingProc(int money, String sendName, String recvName) {
        String queryPlus = "update ACCNT set money = money + ? where name = ?";
        String queryMinus = "update ACCNT set money = money - ? where name = ?";
        try {
//            수신자의 계좌에 금액 추가
            pstmt = con.prepareStatement(queryPlus);
            pstmt.setInt(1, money);
            pstmt.setString(2, recvName);
            pstmt.executeUpdate();

//            송신자의 계좌에 금액 차감
            pstmt = con.prepareStatement(queryMinus);
            pstmt.setInt(1, money);
            pstmt.setString(2, sendName);
            pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("Exception [Sending Proc] : " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 6. 송금한 후 잔액, 송금한 금액, 수신자 이름, 보낸날짜를 저장하고 보여주는 영역

    public List<sendDTO> viewSend(String sendName) {
        List<sendDTO> sendList = new ArrayList<>();
        String query = "select SENDNAME, RECVNAME, SENDDATE, MONEY from SEND where sendname =?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, sendName);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                sendDTO tempDTO = new sendDTO();
                tempDTO.setSendName(rs.getString("SENDNAME"));
                tempDTO.setRecvName(rs.getString("RECVNAME"));
                tempDTO.setSendDate(rs.getDate("SENDDATE"));
                tempDTO.setMoney(rs.getInt("Money"));
                sendList.add(tempDTO);
            }
        } catch (Exception e) {
            System.out.println("Exception [Record] : " + e.getMessage());
            e.printStackTrace();
        }
        return sendList;
    }

    // 계좌 비밀번호 확인 영역
//   public boolean CheckAccountPassword(String name, int accPwd){
//    boolean result = false;
//    accountDTO dto = new accountDTO();
//    String query = "select accpw from ACCNT where name=?";
//    try{
//        pstmt = con.prepareStatement(query);
//        pstmt.setString(1, name);
//        rs = pstmt.executeQuery();
//
//        if(rs.next()) {
//                dto.setAccPwd(rs.getInt("accpw"));
//        }
//        int accntpw = dto.getAccPwd();
//        if(accntpw == accPwd){
//            result = true;
//        }
//    }
//    catch(Exception e){
//            System.out.println("Exception [CheckAccountPassword]: "+ e.getMessage());
//            e.printStackTrace();
//        }
//        return result;
//    }


    // 송금가능 여부 확인 영역 ( 잔액이 충분한지 확인 )

//    public boolean Check(String name, String account, Integer send_money){
//
//        boolean result = false;
//        accountDTO dto = new accountDTO();
//        String query = "select money from ACCNT WHERE name=? and account=?";
//        try{
//            pstmt = con.prepareStatement(query);
//            pstmt.setString(1, name);
//            pstmt.setString(2, account);
//            rs = pstmt.executeQuery();
//
//            if(rs.next()) {
//                int balance = dto.getMoney();
//
//                if (balance > send_money) {
//                    result = true;
//                }
//            }
//
//        }catch(Exception e){
//            System.out.println("Exception [Check]: "+ e.getMessage());
//            e.printStackTrace();
//           }
//           return result;
//        }
}