package setAccount;

import common.JDBConnect;
import javax.servlet.ServletContext;
import java.sql.SQLException;

public class accountDAO extends JDBConnect {
	public accountDAO(ServletContext application) { super(application); }
	public String searchPassword(String name, String uid, int accPw) {
		String uPw = "";
		String query = "select PW from JSP.ACCNT where name=? and id=? and accpw=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, uid);
			pstmt.setInt(3, accPw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uPw = rs.getString("PW");
				if (uPw != null) {
					return uPw;
				}
				else { uPw = "n"; }
			}
		}
		catch (SQLException e) {
			System.out.println("Exception [Search Password] : "+e.getMessage());
			e.printStackTrace();
		}
		return uPw;
	}
	public accountDTO getRecvInfo(String name, String accnt) {
		accountDTO dto = new accountDTO();
		String query = "select accnt.NAME, accnt.account, accnt.money from accnt where name=? and account=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, accnt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setName(rs.getString("NAME"));
				dto.setAccount(rs.getString("ACCOUNT"));
				dto.setMoney(rs.getInt("MONEY"));
			}
		}
		catch (SQLException e) {
			System.out.println("Exception [getReceive] : "+e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	public accountDTO getAccountPw(String uid, String upwd) {
		accountDTO dto = new accountDTO();
		String query = "select PW FROM ACCNT where id = ? and pw =?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setPwd(rs.getString("PW"));
			}
		}
		catch (SQLException e) { e.getMessage(); }
		return dto;
	}
//	public accountDTO getRecvUser(String name, String account) {
//		accountDTO dto = new accountDTO();
//		String query = "SELECT ID, Account from accnt where id=? and account=?";
//		try{
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, name);
//			pstmt.setString(2, account);
//			if (rs.next()) {
//				dto.setId(rs.getString("NAME"));
//				dto.setAccount(rs.getString("ACCOUNT"));
//			}
//		}
//		catch (SQLException e) {
//			System.out.println("Exception [GET Receive name] : "+e.getMessage());
//			e.printStackTrace();
//		}
//		return dto;
//	}
//	use userid, user password
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
				dto.setMoney(rs.getInt("MONEY"));
			}
		} catch (SQLException e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
//	Use account password
	public accountDTO getAccountDTO(String uid, int accpw) {
		accountDTO dto = new accountDTO();
		String query = "SELECT ID, PW, NAME, ACCPW, Account, MONEY FROM ACCNT WHERE ID = ? OR accpw = ?";
		try {
			pstmt = con.prepareStatement(query);

			System.out.println("query 들어감");

			pstmt.setString(1, uid);
			pstmt.setInt(2, accpw);

			System.out.println("pstmt에 user 할당 끝");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId((String) rs.getObject("ID"));
				dto.setPwd((String) rs.getObject("PW"));
				dto.setName((String) rs.getObject("NAME"));
				dto.setAccPwd(rs.getInt("ACCPW"));
				dto.setAccount((String) rs.getObject("Account"));
				dto.setMoney(rs.getInt("MONEY"));
			}
		} catch (SQLException e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
}
