package createAccount;

import common.JDBConnect;
import setAccount.accountDTO;

import javax.servlet.ServletContext;
import java.sql.SQLException;

public class crtAccntDAO extends JDBConnect {
    public crtAccntDAO(ServletContext application) {
        super(application);
    }
    //	createDTO --> 생성 할 계정의 아이디가 중복 일 경우 Denied 처리 할 영역
    public int createDTO(String name, String id, String pw, String accntPw, String account) {
        accountDTO dto = new accountDTO();
        int result = 0;
        String query = "insert into ACCNT (name, id, pw, accpw, account, money) values(?, ?, ?, ?, ?, ?)";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, id);
            pstmt.setString(3, pw);
            pstmt.setString(4, accntPw);
            pstmt.setString(5, account);
            pstmt.setString(6, "1");
            result = pstmt.executeUpdate();
            System.out.println(pstmt);
        } catch (SQLException e) {
            System.out.println("Exception [Get Account DTO] : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
