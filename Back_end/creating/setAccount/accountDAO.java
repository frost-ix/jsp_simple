import common.JDBConnect;

public class accountDAO extends JDBConnect {
	public accountDAO(String drv, String url, String id, String pwd) {
		super(drv, url, id, pwd);
	}

	public accountDTO getAccountDTO(String uid, String upwd) {
		accountDTO dto = new accountDTO();
		String query = "select * from acct where ID=? and PW=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("ID"));
				dto.setPw(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setAccpw(res.getString("ACCPW"));
				dto.setAccount(res.getString("Account"));
				dto.setMoney(res.getString("MONEY"));
			}
		} catch (Exception e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
}
