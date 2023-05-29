package crud;

import common.JDBConnect;

import javax.servlet.ServletContext;
import java.sql.SQLException;

public class delAccntDAO extends JDBConnect {
    public delAccntDAO (ServletContext ap) { super(ap); }
    public int deleteDAO(String name, String pw, int accpw) {
        int result = 0;
        String query = "DELETE FROM ACCNT Where name=? and pw = ? and accpw = ? and money=0";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, pw);
            pstmt.setInt(3, accpw);
            result = pstmt.executeUpdate();
        }
        catch (SQLException e ) {
            System.out.println("Exception [delete] : "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
