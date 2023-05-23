package setAccount;

import common.JDBConnect;
import javax.servlet.ServletContext;
import java.sql.SQLException;

public class accountDAO extends JDBConnect {
	public accountDAO(ServletContext application) { super(application); }
	public accountDTO getAccountDTO(String uid, String upwd) {
		accountDTO dto = new accountDTO();
		String query = "SELECT ID, PW, NAME, ACCPW, Account, MONEY FROM ACCNT WHERE ID = ? OR PW = ?";
		try {
			pstmt = con.prepareStatement(query);

			System.out.println("query 들어감");

			pstmt.setString(1, uid);
			pstmt.setString(2, upwd);

			System.out.println("pstmt에 string 할당 끝");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId((String) rs.getObject("ID"));
				dto.setPwd((String) rs.getObject("PW"));
				dto.setName((String) rs.getObject("NAME"));
				dto.setAccPwd(rs.getInt("ACCPW"));
				dto.setAccount((String) rs.getObject("Account"));
				dto.setMoney(String.valueOf(rs.getObject("MONEY")));
			}
		} catch (SQLException e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
}
