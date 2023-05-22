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
    public int createDTO(accountDTO dto) {
        int result = 0;
        String query = "insert into ACCNT (name, id, pw, accpw, account, money) ";
        query += "values(?, ?, ?, ?, ?, ?)";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getId());
            pstmt.setString(3, dto.getPwd());
            pstmt.setString(4, dto.getAccPwd());
            pstmt.setString(5, dto.getAccount());
            pstmt.setString(6, dto.getMoney());
            result = pstmt.executeUpdate();
            System.out.println(pstmt);
        } catch (SQLException e) {
            System.out.println("Exception [Get Account DTO] : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
