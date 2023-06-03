package crud;

import common.JDBConnect;
import setAccount.accountDTO;
import javax.servlet.ServletContext;
import java.sql.SQLException;

public class upAccntDAO extends JDBConnect {
    public upAccntDAO(ServletContext ap) { super(ap); }
    public int updateAccountPwd(String id, String pw) {
        int result = 0;
        String query = "update ACCNT set pw = ? where ID = ?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, pw);
            pstmt.setString(2, id);
            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("Exception [Update query] : "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
    public int rewardCash(String id, String pw, int money) {
        int result = 0;
        String query = "update accnt set money = money + ? where id = ? and pw = ?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, money);
            pstmt.setString(2, id);
            pstmt.setString(3, pw);
            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("Exception [reward Cash] : "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
